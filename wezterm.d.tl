-- vim:ft=teal

local WeztermNF = require("wezterm-nf")

local enum AudibleBell
  "SystemBeep"
  "Disabled"
end

local enum BypassMouseReportingModifiers
  "SHIFT"
  "ALT"
end

local enum CanonicalizePastedNewlines
  "None"
  "LineFeed"
  "CarriageReturn"
  "CarriageReturnAndLineFeed"
end

local enum ColorBlend
  "Rgb"
  "LinearRgb"
  "Hsv"
  "Oklab"
end

local record ColorScheme
  ansi: {string}
  background: string
  brights: {string}
  cursor_bg: string
  cursor_border: string
  cursor_fg: string
  foreground: string
  indexed: {integer:string}
  selection_bg: string
  selection_fg: string
end

local record ColorSchemeMetadata
  author: string
  name: string
end

local record DaemonOptions
  stdout: string
  stderr: string
  pid_file: string
end

local enum DefaultCursorStyle
  "SteadyBlock"
  "BlinkingBlock"
  "SteadyUnderline"
  "BlinkingUnderline"
  "SteadyBar"
  "BlinkingBar"
end

local enum EasingFunction
  "Linear"
  "Ease"
  "EaseIn"
  "EaseOut"
  "EaseInOut"
  "Constant"
end

local enum ExitBehaviour
  "Close"
  "Hold"
  "CloseOnCleanExit"
end

local enum FontAntialias
  "None"
  "Greyscale"
  "Subpixel"
end

local enum FontHinting
  "None"
  "Vertical"
  "VerticalSubpixel"
  "Full"
end

local enum FontLocator
  "ConfigDirsOnly"
end

local enum FontRasterizer
  "FreeType"
end

local enum FontShaper
  "Allsorts"
  "Harfbuzz"
end

local enum FrontEnd
  "OpenGL"
  "Software"
end

local record HSB
  hue: number
  saturation: number
  brightness: number
end

local record HyperLinkRule
  regex: string
  format: string
end

local enum ImePreeditRendering
  "Builtin"
  "System"
end

local record InactivePaneHSB
  saturation: number
  brightness: number
end

local enum Interpolation
  "Linear"
  "Basis"
  "CatmullRom"
end

local enum KeyMapPreference
  "Mapped"
  "Physical"
end

local record KeyTable
  key: string
  mods: string
  action: wezterm.action
end

local record Leader
  key: string
  mods: string
  timeout_milliseconds: number
end

local enum Orientation
  "Horizontal"
  "Vertical"
end

local enum QuoteDroppedFiles
  "None"
  "SpacesOnly"
  "Posix"
  "Windows"
  "WindowsAlwaysQuoted"
end

local enum SSHBackend
  "Ssh2"
  "LibSsh"
end

local record TabBarStyle
  -- TODO: this should be wezterm.format | string
  active_tab_left: string
  active_tab_right: string
  inactive_tab_left: string
  inactive_tab_right: string
end

local record TLSDomain
  name: string
  bootstrap_via_ssh: string
  remote_address: string
  pem_private_key: string
  pem_cert: string
  pem_ca: string
  pem_root_certs: string
  accept_invalid_hostnames: boolean
  expected_cn: string
  read_timeout: integer
  write_timeout: integer
  remote_wezterm_path: string
end

local record TLSServer
  bind_address: string
  pem_private_key: string | nil
  pem_cert: string | nil
  pem_ca: string | nil
  pem_root_certs: string | nil
end

local record UnixDomain
  name: string
  socket_path: string
  no_serve_automatically: boolean
  skip_permissions_check: boolean
  proxy_command: {string}
  local_echo_threshold_ms: integer
end

local record VisualBell
  fade_in_function: EasingFunction
  fade_in_duration_ms: integer
  fade_out_function: EasingFunction
  fade_out_duration_ms: integer
  enum VisualBellTarget
    "BackgroundColor"
    "CursorColor"
  end
  target: VisualBellTarget
end

local enum WindowCloseConfirmation
  "AlwaysPrompt"
  "NeverPrompt"
end

local enum WindowDecoration
  "NONE"
  "TITLE"
  "RESIZE"
  "TITLE | RESIZE"
end

local record WindowFrame
  inactive_titlebar_bg: string
  active_titlebar_bg: string
  inactive_titlebar_fg: string
  active_titlebar_fg: string
  inactive_titlebar_border_bottom: string
  active_titlebar_border_bottom: string
  button_fg: string
  button_bg: string
  button_hover_fg: string
  button_hover_bg: string
  border_left_width: string
  border_right_width: string
  border_bottom_height: string
  border_top_height: string
  border_left_color: string
  border_right_color: string
  border_bottom_color: string
  border_top_color: string
end

local record WindowPadding
  left: number
  right: number
  top: number
  bottom: number
end

local enum FreetypeTarget
  "Normal"
  "Light"
  "Mono"
  "HorizontalLcd"
end

local enum FontStretch
  "UltraCondensed"
  "ExtraCondensed"
  "Condensed"
  "SemiCondensed"
  "Normal"
  "SemiExpanded"
  "Expanded"
  "ExtraExpanded"
  "UltraExpanded"
end

local enum FontStyle
  "Normal"
  "Italic"
  "Oblique"
end

local enum FontWeight
  "Thin"
  "ExtraLight"
  "Light"
  "DemiLight"
  "Book"
  "Regular"
  "Medium"
  "DemiBold"
  "Bold"
  "ExtraBold"
  "Black"
  "ExtraBlack"
end

local record FontOptionsTable
  family: string | nil
  weight: FontWeight | nil
  stretch: FontStretch | nil
  style: FontStyle | nil
  harfbuzz_features: {string} | nil
  freetype_load_target: FreetypeTarget | nil
  freetype_render_target: FreetypeTarget | nil
  freetype_load_flags: string | nil
end

local type FontOptions = FontOptionsTable | string

-- the type returned from `wezterm.font` & `wezterm.font_with_fallback`
local record FontOptionsInfo
  record Info
    family: string | nil
    weight: FontWeight | nil
    stretch: FontStretch | nil
    style: FontStyle | nil
    harfbuzz_features: {string} | nil
    freetype_load_target: FreetypeTarget | nil
    freetype_render_target: FreetypeTarget | nil
    freetype_load_flags: string | nil
    is_fallback: boolean
    is_synthetic: boolean
  end
  font: {Info}
end

local record WindowBackgroundGradient
  orientation: Orientation
  colors: {string}
  interpolation: Interpolation
  blend: ColorBlend
  noise: integer
  enum Preset
    "Blues"
    "BrBg"
    "BuGn"
    "BuPu"
    "Cividis"
    "Cool"
    "CubeHelixDefault"
    "GnBu"
    "Greens"
    "Greys"
    "Inferno"
    "Magma"
    "OrRd"
    "Oranges"
    "PiYg"
    "Plasma"
    "PrGn"
    "PuBu"
    "PuBuGn"
    "PuOr"
    "PuRd"
    "Purples"
    "Rainbow"
    "RdBu"
    "RdGy"
    "RdPu"
    "RdYlBu"
    "RdYlGn"
    "Reds"
    "Sinebow"
    "Spectral"
    "Turbo"
    "Viridis"
    "Warm"
    "YlGn"
    "YlGnBu"
    "YlOrBr"
    "YlOrRd"
  end
  preset: Preset
  segment_size: integer
  segment_smoothness: number
end

local record WSLDomain
  name: string
  distribution: string
  username: string | nil
  default_cwd: string | nil
  default_prog: {string} | nil
end

local record SSHDomain
  name: string
  remote_address: string
  no_agent_auth: boolean | nil
  username: string | nil
  connect_automatically: boolean | nil
  timeout: integer | nil
  remote_wezterm_path: string | nil
  enum Multiplexing
    "WezTerm"
    "None"
  end
  ssh_option: {string:string} | nil
  multiplexing: Multiplexing | nil
  default_prog: {string} | nil
  enum AssumeShell
    "Unknown"
    "Posix"
  end
  assume_shell: AssumeShell | nil
  local_echo_threshold_ms: integer | nil
end

local record wezterm
  record Action
    record ActivateKeyTableT
      name: string
      timeout_milliseconds: integer
      one_shot: boolean
    end

    record SpawnCommandInNewWindowT
      label: string
      args: {string}
      cwd: string
      set_environment_variables: {string:string}
      domain: any
    end

    ActivateKeyTable: ActivateKeyTableT
    SpawnCommandInNewWindow: SpawnCommandInNewWindowT
  end

  record BatteryInfo
    state_of_charge: number
    vendor: string
    serial_number: string
    time_to_full: integer | nil
    time_to_empty: integer | nil
    enum BatteryInfoState
      "Unknown"
      "Charging"
      "Discharging"
      "Empty"
      "Full"
    end
    state: BatteryInfoState
  end

  GLOBAL: {any:any}
  action: Action
  action_callback: function(callback: function(): any): any
  add_to_config_reload_watch_list: function(path: string): nil
  background_child_process: function(args: any): any
  battery_info: function(): {BatteryInfo}
  column_width: function(string: string): number
  config_dir: string
  config_file: string
  default_wsl_domains: {WSLDomain}
  emit: function(event_name: string, ...: any): boolean
  enumerate_ssh_hosts: function({string} | nil): {SSHDomain}
  executable_dir: string
  font: function(FontOptions): FontOptionsInfo
  font_with_fallback: function(FontOptions): FontOptionsInfo
  format: function({any:any}): string
  get_builtin_color_schemes: function(): {string:any}
  glob: function(pattern: string, relative_to: string | nil): {string}
  gradient_colors: function(gradient: WindowBackgroundGradient, num_colors: integer): {string}
  home_dir: string
  hostname: string
  json_encode: function(value: any): string
  json_parse: function(json: string): any
  log_error: function(...: any): nil
  log_info: function(...: any): nil
  log_warn: function(...: any): nil
  nerdfonts: {WeztermNF:string}
  on: function(event_name: string, callback: function(...: any): any): nil
  open_with: function(path_or_url: string, application: string | nil): any
  pad_left: function(string: string, min_width: integer): string
  pad_right: function(string: string, min_width: integer): string
  permute_any_mods: function(table: any): {any} -- TODO: https://wezfurlong.org/wezterm/config/lua/wezterm/permute_any_mods.html
  permute_any_or_no_mods: function(table: any): {any} -- TODO: https://wezfurlong.org/wezterm/config/lua/wezterm/permute_any_or_no_mods.html
  read_dir: function(path: string): {string}
  reload_configuration: function(): nil
  record RunChildProcess
    success: boolean
    stdout: string
    stderr: string
  end
  run_child_process: function(args: {string}): RunChildProcess
  running_under_wsl: boolean
  shell_join_args: function({string}): string
  shell_quote_arg: function(string: string): string
  shell_split: function(string: string): {string}
  sleep_ms: function(milliseconds: integer): nil
  split_by_newlines: function(string: string): {string}
  strftime: function(format: string): string
  strftime_utc: function(format: string): string
  target_triple: string
  truncate_left: function(string: string, max_width: integer): string
  truncate_right: function(string: string, max_width: integer): string
  utf16_to_utf8: function(string: string): string
  version: string

  record WeztermColor
    record ExtractParams
      num_colors: integer
      threshold: number
    end
    extract_colors_from_image: function(path: string, params: ExtractParams): {string}
    -- TODO: https://wezfurlong.org/wezterm/config/lua/color/index.html
    from_hsla: function(h: number, s: number, l: number, a: number): any
    get_builtin_schemes: function(): {string:any}
    get_default_colors: function(): {string:string}
    gradient: function(gradient: WindowBackgroundGradient, num_colors: integer): {string}
    load_base16_scheme: function(filename: string): {ColorScheme, ColorSchemeMetadata}
    load_scheme: function(filename: string): {ColorScheme, ColorSchemeMetadata}
    load_terminal_sexy_scheme: function(filename: string): {ColorScheme, ColorSchemeMetadata}
    parse: function(string: string): any -- TODO: maybe a string? https://wezfurlong.org/wezterm/config/lua/wezterm.color/parse.html
    save_scheme: function(colors: ColorScheme, metadata: ColorSchemeMetadata, filename: string): nil
  end
  color: WeztermColor

  record GUI
    enum Appearance
      "Light"
      "Dark"
      "LightHighContrast"
      "DarkHighContrast"
    end
    default_key_tables: {string:any}
    default_keys: {string:any}
    get_appearance: function(): Appearance
    gui_window_for_mux_window: function(window_id: integer): any -- TODO: once GuiWindow is typed

    record Screens
      record Screen
        name: string
        height: integer
        width: integer
        x: integer
        y: integer
        max_fps: number | nil
      end
      active: {Screen}
      by_name: {string:Screen}
      main: Screen
      origin_x: integer
      origin_y: integer
      virtual_height: integer
      virtual_width: integer
    end
    screens: function(): Screens
  end
  gui: GUI

  record WeztermMux
    all_windows: function(): {any} -- TODO: once MuxWindow is typed
    get_active_workspace: function(): string
    get_pane: function(pane_id: integer): any -- TODO: once Pane is typed
    get_tab: function(tab_id: integer): any -- TODO: once MuxTab is typed
    get_window: function(window_id: integer): any -- TODO: once MuxWindow is typed
    get_workspace_names: function(): {string}
    set_active_workspace: function(name: string): nil
    spawn_window: function(args: any): {any, any, any} -- TODO: MuxTab, Pane, MuxWindow
  end
  mux: WeztermMux

  record WeztermProcInfo
    current_working_dir_for_pid: function(pid: integer): string | nil
    executable_path_for_pid: function(pid: integer): string | nil
    record LocalProcessInfo
      argv: {string}
      children: {integer:LocalProcessInfo}
      cwd: string
      executable: string
      name: string
      pid: integer
      ppid: integer
      start_time: integer
      enum LocalProcessInfoStatus
        "Idle"
        "Run"
        "Sleep"
        "Stop"
        "Zombie"
        "Tracing"
        "Dead"
        "Wakekill"
        "Waking"
        "Parked"
        "LockBlocked"
        "Unknown"
      end
      status: LocalProcessInfoStatus
    end
    get_info_for_pid: function(pid: integer): {string:string}
    pid: function(): integer
  end
  proc_info: WeztermProcInfo

  record WeztermTime
    format: function(format: string): string
    format_utc: function(format: string): string
    record SunTimes
      progression: number
      rise: string
      set: string
      up: boolean
    end
    sun_times: function(lat: number, lon: number): SunTimes
  end

  record WeztermTimeModule
    call_after: function(interval_seconds: number, function(callback: function(): any)): any
    now: function(): WeztermTime
    parse: function(str: string, format: string): string
    parse_rfc3339: function(str: string): string
  end
  time: WeztermTimeModule

  Config: WeztermConfig
end

local record WeztermConfig
  adjust_window_size_when_changing_font_size: boolean
  allow_square_glyphs_to_overflow_width: boolean
  allow_win32_input_mode: boolean
  alternate_buffer_wheel_scroll_speed: integer
  animation_fps: integer
  audible_bell: AudibleBell
  automatically_reload_config: boolean
  background: any -- TODO: https://wezfurlong.org/wezterm/config/lua/config/background.html
  bold_brightens_ansi_colors: boolean
  bypass_mouse_reporting_modifiers: BypassMouseReportingModifiers
  canonicalize_pasted_newlines: boolean | CanonicalizePastedNewlines
  cell_width: number
  check_for_updates: boolean
  check_for_updates_interval_seconds: integer
  clean_exit_codes: {number}
  color_scheme: string -- TODO: https://wezfurlong.org/wezterm/config/appearance.html#defining-a-color-scheme-in-your-weztermlua
  color_schemes: any -- TODO ^^^
  colors: any
  cursor_blink_ease_in: EasingFunction
  cursor_blink_ease_out: EasingFunction
  cursor_blink_rate: integer
  cursor_thickness: string
  custom_block_glyphs: boolean
  daemon_options: DaemonOptions
  debug_key_events: boolean
  default_cursor_style: DefaultCursorStyle
  default_cwd: string
  default_domain: string
  default_gui_startup_args: {string}
  default_prog: {string}
  default_workspace: string
  detect_password_input: boolean
  disable_default_key_bindings: boolean
  disable_default_mouse_bindings: boolean
  disable_default_quick_select_patterns: boolean
  dpi: number
  enable_csi_u_key_encoding: boolean
  enable_kitty_keyboard: boolean
  enable_scroll_bar: boolean
  enable_tab_bar: boolean
  enable_wayland: boolean
  exit_behavior: ExitBehaviour
  font: any -- TODO: once wezterm.font is typed
  font_antialias: FontAntialias
  font_dirs: {string}
  font_hinting: FontHinting
  font_locator: FontLocator | nil
  font_rasterizer: FontRasterizer
  font_rules: any -- TODO: https://wezfurlong.org/wezterm/config/lua/config/font_rules.html
  font_shaper: FontShaper
  font_size: number
  force_reverse_video_cursor: boolean
  foreground_text_hsb: HSB
  freetype_interpreter_version: integer
  freetype_load_flags: string
  freetype_load_target: FreetypeTarget
  freetype_pcf_long_family_names: boolean
  freetype_render_target: FreetypeTarget
  front_end: FrontEnd
  harfbuzz_features: {string}
  hide_tab_bar_if_only_one_tab: boolean
  hyperlink_rules: {HyperLinkRule}
  ime_preedit_rendering: ImePreeditRendering
  inactive_pane_hsb: InactivePaneHSB
  initial_cols: integer
  initial_rows: integer
  key_map_preference: KeyMapPreference
  key_tables: {KeyTable}
  launch_menu: any -- TODO: https://wezfurlong.org/wezterm/config/launch.html#the-launcher-menu
  leader: Leader
  line_height: number
  max_fps: integer
  min_scroll_bar_height: string
  mux_env_remove: {string}
  native_macos_fullscreen_mode: boolean
  normalize_output_to_unicode_nfc: boolean
  pane_focus_follows_mouse: boolean
  prefer_egl: boolean
  quick_select_alphabet: string
  quick_select_patterns: {string}
  quote_dropped_files: QuoteDroppedFiles
  scroll_to_bottom_on_input: boolean
  scrollback_lines: integer
  selection_word_boundary: string
  set_environment_variables: {string:string}
  show_new_tab_button_in_tab_bar: boolean
  show_tab_index_in_tab_bar: boolean
  show_tabs_in_tab_bar: boolean
  show_update_window: boolean
  skip_close_confirmation_for_processes_named: {string}
  ssh_backend: SSHBackend
  ssh_domains: {SSHDomain}
  status_update_interval: integer
  strikethrough_position: string | number
  swallow_mouse_click_on_pane_focus: boolean
  swallow_mouse_click_on_window_focus: boolean
  swap_backspace_and_delete: boolean
  switch_to_last_active_tab_when_closing_tab: boolean
  tab_and_split_indices_are_zero_based: boolean
  tab_bar_at_bottom: boolean
  tab_bar_style: TabBarStyle
  tab_max_width: number
  term: string
  text_blink_ease_in: EasingFunction
  text_blink_ease_out: EasingFunction
  text_blink_rapid_ease_in: EasingFunction
  text_blink_rapid_ease_out: EasingFunction
  text_blink_rate: integer
  text_blink_rate_rapid: integer
  tls_clients: {TLSDomain}
  tls_servers: {TLSServer}
  treat_east_asian_ambiguous_width_as_wide: boolean
  treat_left_ctrlalt_as_altgr: boolean
  underline_position: string | number
  underline_thickness: string | number
  unicode_version: integer
  unix_domains: {UnixDomain}
  unzoom_on_switch_pane: boolean
  use_cap_height_to_scale_fallback_fonts: boolean
  use_fancy_tab_bar: boolean
  use_ime: boolean
  use_resize_increments: boolean
  visual_bell: VisualBell
  warn_about_missing_glyphs: boolean
  window_background_gradient: WindowBackgroundGradient
  window_close_confirmation: WindowCloseConfirmation
  window_decorations: WindowDecoration
  window_frame: WindowFrame
  window_padding: WindowPadding
  wsl_domains: {WSLDomain}
  xim_im_name: string
end

return wezterm
