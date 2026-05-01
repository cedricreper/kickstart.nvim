local utils = require 'cursor-dark-anysphere.utils'

local M = {}

--cursor-syntax-foreground: #e4e4e4
--cursor-syntax-background: #181818;
--cursor-syntax-keyword: #82D2CE;
--cursor-syntax-string: #E394DC;
--cursor-syntax-function: #EFB080;
--cursor-syntax-number: #EBC88D;
--cursor-syntax-comment: #E4E4E4;
--cursor-syntax-parameter: #D6D6DD;
--cursor-syntax-punctuation: #e4e4e4
--cursor-syntax-string-expression: #E394DC;
--cursor-syntax-attribute: #AAA0FA; -
--cursor-syntax-property: #AAA0FA;
--cursor-syntax-type: #EFB080;
--cursor-syntax-variable: #87C3FF;
--cursor-syntax-class: #EFB080;
--cursor-syntax-language-variable: #CC7C8A;
--cursor-syntax-constant-variable: #AAA0FA;

-- Raw colors from VSCode theme
M.vscode_colors = {
  -- Backgrounds
  editor_bg = '#1a1a1a',
  ui_bg = '#141414',
  minimap_bg = '#181818',

  -- Foregrounds
  editor_fg = '#D8DEE9',
  ui_fg = '#CCCCCCdd',
  ui_fg_dim = '#CCCCCC99',
  comment = '#FFFFFF5C',

  -- Base colors
  white = '#FFFFFF',
  black = '#000000',
  gray1 = '#2A2A2A',
  gray2 = '#404040',
  gray3 = '#505050',
  gray4 = '#606060',
  gray5 = '#767676',
  gray6 = '#898989',
  gray7 = '#CCCCCC',
  gray8 = '#D8DEE9',

  -- Accent colors
  blue1 = '#81A1C1',
  blue2 = '#88C0D0',
  blue3 = '#94c1fa',
  blue4 = '#82d2ce',
  blue5 = '#94C1FA',

  green1 = '#A3BE8C',
  green2 = '#a8cc7c',
  green3 = '#15ac91',

  yellow1 = '#EBCB8B',
  yellow2 = '#efb080',
  yellow3 = '#eeb080',
  yellow4 = '#ffdf00',
  yellow5 = '#fad075',
  yellow6 = '#e5b95c',
  yellow7 = '#ea7620',

  red1 = '#BF616A',
  red2 = '#f14c4c',
  red3 = '#f44747',
  red4 = '#cc7c8a',
  red5 = '#C1808A',

  purple1 = '#B48EAD',
  purple2 = '#aaa0fa',
  purple3 = '#aaa0fa',
  purple4 = '#af9cff',

  pink = '#e394dc',

  -- Special values
  transparent = '#00000000',

  -- Alpha colors (to be processed)
  activity_fg = '#CCCCCC99',
  diff_added_bg = '#A3BE8C22',
  diff_removed_bg = '#BF616A22',
  find_match_bg = '#88C0D066',
  find_match_highlight_bg = '#88C0D044',
  find_range_highlight_bg = '#FFFFFF33',
  inactive_selection_bg = '#40404077',
  selection_bg = '#40404099',
  selection_highlight_bg = '#404040CC',
  snippet_highlight_bg = '#CCCCCC55',
  word_highlight_bg = '#ffffff21',
  word_highlight_strong_bg = '#ffffff2d',
  bracket_match_bg = '#14141400',
  bracket_match_border = '#FFFFFF55',
  group_border = '#ffffff0d',
  group_drop_bg = '#2A2A2A99',
  tabs_border = '#FFFFFF0D',
  editorInlayHint_bg = '#00000000',
  editorOverviewRuler_added = '#A3BE8C99',
  editorOverviewRuler_deleted = '#BF616A99',
  editorOverviewRuler_modified = '#EBCB8B99',
  editorOverviewRuler_border = '#00000000',
  editorWarning_border = '#CCCCCC00',
  editorError_border = '#BF616A00',
  editorWhitespace_fg = '#505050',
  editorIndentGuide_bg = '#404040',
  input_bg = '#2A2A2A55',
  input_placeholder_fg = '#FFFFFF99',
  list_active_selection_bg = '#ffffff1d',
  list_inactive_selection_bg = '#ffffff10',
  list_inactive_selection_fg = '#ffffffd7',
  list_drop_bg = '#FFFFFF99',
  list_hover_bg = '#2A2A2A99',
  menubar_selection_bg = '#CCCCCC33',
  merge_border = '#2A2A2A00',
  merge_current_content_bg = '#88C0D04D',
  merge_current_header_bg = '#88C0D066',
  merge_incoming_content_bg = '#A3BE8C4D',
  merge_incoming_header_bg = '#A3BE8C66',
  panel_border = '#FFFFFF0D',
  panel_title_active_border = '#FFFFFF00',
  panel_title_inactive_fg = '#CCCCCC99',
  peek_match_highlight_bg = '#FFFFFF66',
  peek_result_line_fg = '#FFFFFF66',
  scrollbar_shadow = '#00000000',
  scrollbar_slider_active_bg = '#60606055',
  scrollbar_slider_bg = '#40404055',
  scrollbar_slider_hover_bg = '#40404055',
  selection_bg_global = '#FFFFFF33',
  sidebar_border = '#FFFFFF0D',
  sidebar_fg = '#E5E5E5',
  statusbar_fg = '#cccccc82',
  statusbar_border = '#FFFFFF0D',
  tab_active_border_top = '#FFFFFF00',
  tab_border = '#FFFFFF0D',
  tab_hover_bg = '#FFFFFF00',
  tab_unfocused_active_border = '#88C0D000',
  tab_unfocused_active_fg = '#FFFFFF99',
  tab_unfocused_hover_bg = '#2A2A2AB3',
  tab_unfocused_hover_border = '#88C0D000',
  tab_unfocused_inactive_fg = '#FFFFFF66',
  terminal_fg = '#FFFFFFcc',
  terminal_selection_bg = '#636262dd',
  terminal_cursor_bg = '#FFFFFF22',
  titlebar_fg = '#cccccc82',
  titlebar_border = '#FFFFFF0D',
  titlebar_inactive_fg = '#cccccc60',
  tree_indent_guides = '#CCCCCC55',
  widget_shadow = '#00000066',
  minimap_find_match = '#15ac9170',
  marker_navigation_bg = '#ffffff70',
  marker_navigation_error_bg = '#BF616AC0',
  picker_group_border = '#2A2A2A00',

  -- Minimap colors
  minimap_gutter_added_bg = '#15ac91',
  minimap_gutter_modified_bg = '#e5b95c',
  minimap_gutter_deleted_bg = '#f14c4c',
  minimap_selection_highlight = '#363636',
  minimap_error_highlight = '#f14c4c',
  minimap_warning_highlight = '#ea7620',

  -- Button variants
  button_secondary_bg = '#565656',
  button_secondary_fg = '#ececec',
  button_secondary_hover_bg = '#767676',

  -- Input validation colors
  input_validation_error_fg = '#141414',
  input_validation_warning_fg = '#141414',

  -- Extension button colors
  extension_button_prominent_bg = '#565656',
  extension_button_prominent_fg = '#FFFFFF',
  extension_button_prominent_hover_bg = '#767676',
}

-- Get processed colors based on transparency mode
---@param mode string 'blended', 'transparent', or 'opaque'
---@return table colors Processed color palette
function M.get_colors(mode)
  mode = mode or 'blended'

  local c = {}

  -- Copy all colors
  for k, v in pairs(M.vscode_colors) do
    c[k] = v
  end

  local bg = M.vscode_colors.editor_bg
  local ui_bg = M.vscode_colors.ui_bg

  -- Alpha colors that blend against editor_bg
  local editor_bg_keys = {
    'comment',
    'diff_added_bg',
    'diff_removed_bg',
    'find_match_bg',
    'find_match_highlight_bg',
    'find_range_highlight_bg',
    'selection_bg',
    'selection_highlight_bg',
    'inactive_selection_bg',
    'word_highlight_bg',
    'word_highlight_strong_bg',
    'snippet_highlight_bg',
    'bracket_match_border',
    'group_border',
    'editorIndentGuide_bg',
    'editorWhitespace_fg',
    'scrollbar_slider_bg',
    'scrollbar_slider_hover_bg',
    'scrollbar_slider_active_bg',
    'merge_current_content_bg',
    'merge_current_header_bg',
    'merge_incoming_content_bg',
    'merge_incoming_header_bg',
    'group_drop_bg',
    'editorOverviewRuler_added',
    'editorOverviewRuler_deleted',
    'editorOverviewRuler_modified',
  }

  -- Alpha colors that blend against ui_bg
  local ui_bg_keys = {
    'ui_fg_dim',
    'activity_fg',
    'list_active_selection_bg',
    'list_inactive_selection_bg',
    'list_hover_bg',
    'menubar_selection_bg',
    'input_bg',
    'input_placeholder_fg',
    'terminal_fg',
    'terminal_selection_bg',
    'terminal_cursor_bg',
    'statusbar_fg',
    'titlebar_fg',
    'titlebar_inactive_fg',
    'panel_title_inactive_fg',
    'sidebar_fg',
    'tree_indent_guides',
    'widget_shadow',
    'peek_match_highlight_bg',
    'peek_result_line_fg',
    'marker_navigation_bg',
    'marker_navigation_error_bg',
    'tab_unfocused_active_fg',
    'tab_unfocused_hover_bg',
    'tab_unfocused_inactive_fg',
    'list_drop_bg',
    'panel_border',
    'sidebar_border',
    'statusbar_border',
    'tab_border',
    'titlebar_border',
    'tabs_border',
  }

  for _, key in ipairs(editor_bg_keys) do
    if M.vscode_colors[key] then
      c[key] = utils.process_color(M.vscode_colors[key], bg, mode)
    end
  end

  for _, key in ipairs(ui_bg_keys) do
    if M.vscode_colors[key] then
      c[key] = utils.process_color(M.vscode_colors[key], ui_bg, mode)
    end
  end

  c.minimap_find_match = utils.process_color(M.vscode_colors.minimap_find_match, M.vscode_colors.minimap_bg, mode)

  return c
end

-- Get blend values for floating windows
function M.get_blend_values()
  return {
    normal_float = utils.extract_blend '#00000033' or 20,
    popup = utils.extract_blend '#00000055' or 33,
    menu = utils.extract_blend '#00000066' or 40,
  }
end

return M
