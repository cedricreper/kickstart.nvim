local M = {}

-- Convert hex color to RGB components
---@param hex string Hex color like "#RRGGBB" or "#RRGGBBAA"
---@return number? r Red (0-255)
---@return number? g Green (0-255)
---@return number? b Blue (0-255)
---@return number? a Alpha (0-255) if present
function M.hex_to_rgb(hex)
    if not hex or type(hex) ~= "string" then return nil end
    if hex == "NONE" or hex == "none" or hex == "" then return nil end

    hex = hex:gsub("^#", ""):upper()

    local r, g, b, a
    if #hex == 3 then
        r = tonumber(hex:sub(1, 1):rep(2), 16)
        g = tonumber(hex:sub(2, 2):rep(2), 16)
        b = tonumber(hex:sub(3, 3):rep(2), 16)
    elseif #hex == 6 then
        r = tonumber(hex:sub(1, 2), 16)
        g = tonumber(hex:sub(3, 4), 16)
        b = tonumber(hex:sub(5, 6), 16)
    elseif #hex == 8 then
        r = tonumber(hex:sub(1, 2), 16)
        g = tonumber(hex:sub(3, 4), 16)
        b = tonumber(hex:sub(5, 6), 16)
        a = tonumber(hex:sub(7, 8), 16)
    else
        return nil
    end

    if not r or not g or not b then return nil end
    return r, g, b, a
end

-- Convert RGB components to hex color
---@param r number Red (0-255)
---@param g number Green (0-255)
---@param b number Blue (0-255)
---@return string hex "#RRGGBB"
function M.rgb_to_hex(r, g, b)
    return string.format("#%02X%02X%02X",
        math.floor(r + 0.5),
        math.floor(g + 0.5),
        math.floor(b + 0.5)
    )
end

-- Blend foreground over background with alpha
---@param fg string Foreground hex color
---@param bg string Background hex color
---@param alpha number Alpha (0-1)
---@return string hex Blended color
function M.blend(fg, bg, alpha)
    if not fg or fg == "NONE" then return bg or "#000000" end
    if not bg or bg == "NONE" then return fg end
    if alpha <= 0 then return bg end
    if alpha >= 1 then return fg end

    local fr, fg_g, fb = M.hex_to_rgb(fg)
    local br, bg_g, bb = M.hex_to_rgb(bg)
    if not fr then return bg end
    if not br then return fg end

    return M.rgb_to_hex(
        fr * alpha + br * (1 - alpha),
        fg_g * alpha + bg_g * (1 - alpha),
        fb * alpha + bb * (1 - alpha)
    )
end

-- Process a color that may have an alpha channel
---@param color string Hex color (may include alpha)
---@param bg string Background color to blend with
---@param mode string 'blended', 'transparent', or 'opaque'
---@return string hex Processed color
function M.process_color(color, bg, mode)
    if not color or color == "" or color == "NONE" then return color or "" end

    local r, g, b, a = M.hex_to_rgb(color)
    if not r then return color end
    if not a then return color end

    if mode == "transparent" or mode == "opaque" then
        return M.rgb_to_hex(r, g, b)
    end

    -- blended (default)
    if not bg or bg == "" or bg == "NONE" then
        return M.rgb_to_hex(r, g, b)
    end
    return M.blend(M.rgb_to_hex(r, g, b), bg, a / 255)
end

-- Extract alpha as Neovim blend value (0-100)
---@param color string Hex color like "#RRGGBBAA"
---@return number? blend Blend value (0=opaque, 100=transparent)
function M.extract_blend(color)
    if not color or color == "" then return nil end
    local _, _, _, a = M.hex_to_rgb(color)
    if a then
        return math.floor((1 - a / 255) * 100 + 0.5)
    end
    return nil
end

-- Lighten a color by a percentage
---@param color string Hex color
---@param percent number Percentage (0-100)
---@return string hex Lightened color
function M.lighten(color, percent)
    local r, g, b = M.hex_to_rgb(color)
    if not r then return color end
    local f = percent / 100
    return M.rgb_to_hex(r + (255 - r) * f, g + (255 - g) * f, b + (255 - b) * f)
end

-- Darken a color by a percentage
---@param color string Hex color
---@param percent number Percentage (0-100)
---@return string hex Darkened color
function M.darken(color, percent)
    local r, g, b = M.hex_to_rgb(color)
    if not r then return color end
    local f = 1 - (percent / 100)
    return M.rgb_to_hex(r * f, g * f, b * f)
end

return M
