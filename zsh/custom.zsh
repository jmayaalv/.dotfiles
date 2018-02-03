ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=240"
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
POWERLEVEL9K_MODE='awesome-fontconfig'
ZSH_THEME="powerlevel9k/powerlevel9k"


zsh_internet_signal(){
  #Try to ping google DNS to see if you have internet
  local net=$(ping 8.8.8.8 -c 1| grep transmitted | awk '{print $6}' | grep 0)
  local color='%F{red}'
  local symbol="\uf127"
  if [[ ! -z "$net" ]] ; 
  then color='%F{green}' ; symbol="\uf1e6" ;
  fi

  echo -n "%{$color%}$symbol" # \f1eb is wifi bars
}
#Get the weather information from https://www.apixu.com/
#Just create a free account to have an API key
#Download jq do convert json
zsh_weather(){
  local weather=$(curl -s "https://api.apixu.com/v1/current.json?key="23e71ebc37e4452888d150516180302"&q="zielonki"")
  local temp=$(echo $weather | jq .current.temp_c)
  local condition=$(echo $weather | jq .current.condition.text)
  #Default value
  local color='%F{green}'
  local symbol="\uf2c7"
  
  if [[ $condition == *"rain"* ]] ;
  then symbol="\uf043" ; color='%F{blue}'
  fi

  if [[ $condition == *"cloudy"* || $condition == *"Overcast"* ]] ;
  then symbol="\uf0c2" ; color='%F{grey}';
  fi

  if [[ $condition == *"Sunny"* ]] ;
  then symbol="\uf185" ; color='%F{yellow}';
  fi

  echo -n "%{$color%}$temp\u2103  $symbol"
}
#Custom IP adress to have it more customable
#Replace "en0" to ex: en0
zsh_custom_ip(){
 local ip=$(ifconfig "en0" | grep Bcast | awk '{print $2}' | cut -f2 -d ':')
 local color="%F{green}"
 echo -n "%{$color%}$ip"
}
## POWERLEVEL9K SETTINGS ##
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%K{black}%F{black} `zsh_weather` %f%k%F{black}%f "
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_CUSTOM_HELLO_WORLD="zsh_hello_world"
POWERLEVEL9K_CUSTOM_INTERNET_SIGNAL="zsh_internet_signal"
POWERLEVEL9K_CUSTOM_IP="zsh_custom_ip"
POWERLEVEL9K_CUSTOM_IP_BACKGROUND="black"
POWERLEVEL9K_CUSTOM_INTERNET_SIGNAL_BACKGROUND="black"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_internet_signal  dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(custom_ip disk_usage status)
POWERLEVEL9K_TIME_FORMAT="%D{\uf073 %d.%m.%y}"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="red"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="black"
POWERLEVEL9K_DIR_HOME_BACKGROUND="black"
POWERLEVEL9K_DIR_HOME_FOREGROUND="blue"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="black"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="blue"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="black"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="blue"

POWERLEVEL9K_VCS_CLEAN_BACKGROUND="black"
POWERLEVEL9K_VCS_CLEAN_FOREGROUND="green"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="black"
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="black"
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="yellow"
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="yellow"
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
##
