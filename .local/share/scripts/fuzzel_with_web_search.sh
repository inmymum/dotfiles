output=$(fuzzel 2>&1); if [[ -n "$output" ]]; then xdg-open "$(echo $output|awk -F': ' '{print $3}')"; fi
