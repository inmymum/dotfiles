output=$(fuzzel 2>&1); if [[ -n "$output" ]]; then mercury-browser --search "$(echo $output|awk -F': ' '{print $3}')"; fi
