pacmd list-clients \
  | awk '($1 == "index:") {i=$2} ($1 == "application.name" && tolower($0) ~ /spotify/) {print i}' \
  | head -n-1 \
  | xargs -n1 pacmd kill-client


pavucontrol
