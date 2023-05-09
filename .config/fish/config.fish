# Fish.
set fish_greeting "" 

# Tide.
set -g tide_left_prompt_items os context pwd git newline character 
set -g tide_right_prompt_items jobs cmd_duration status time
set -g tide_git_icon ''
set -g tide_status_icon_failure ''
set -g tide_character_icon " "
set -g tide_pwd_icon "  "
set -g tide_pwd_icon_home "  "
set -g tide_time_format " %H:%M:%S"
set -g tide_time_bg_color D8DEE9

# Pfetch.
set -gx PF_INFO "ascii title kernel os wm pkgs memory uptime"
set -gx PF_COL1 "4"
set -gx PF_COL2 "9"
set -gx PF_COL3 "1"

# Environment
source ~/.profile

pfetch
