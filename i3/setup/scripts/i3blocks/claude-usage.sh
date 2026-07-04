#!/bin/bash

OUTPUT=$(claude /usage 2>/dev/null | head -4)

if [ -z "$OUTPUT" ]; then
    echo "claude: N/A"
    exit 0
fi

SESSION_LINE=$(echo "$OUTPUT" | grep "Current session:")
WEEK_LINE=$(echo "$OUTPUT" | grep "Current week")

SESSION_PCT=$(echo "$SESSION_LINE" | grep -oP '\d+(?=% used)')
WEEK_PCT=$(echo "$WEEK_LINE" | grep -oP '\d+(?=% used)')
SESSION_RESET=$(echo "$SESSION_LINE" | grep -oP 'resets \K[^(]+' | sed 's/ $//')
WEEK_RESET=$(echo "$WEEK_LINE" | grep -oP 'resets \K[^(]+' | sed 's/ $//')

if [ -z "$SESSION_PCT" ] || [ -z "$WEEK_PCT" ]; then
    echo "claude: parse error"
    exit 0
fi

FULL=" d:${SESSION_PCT}% (↺${SESSION_RESET})  w:${WEEK_PCT}% (↺${WEEK_RESET})"
SHORT=" d:${SESSION_PCT}% w:${WEEK_PCT}%"

echo "$FULL"
echo "$SHORT"

MAX_PCT=$SESSION_PCT
if [ "$WEEK_PCT" -gt "$MAX_PCT" ]; then
    MAX_PCT=$WEEK_PCT
fi

if [ "$MAX_PCT" -ge 90 ]; then
    echo "#FF0000"
elif [ "$MAX_PCT" -ge 70 ]; then
    echo "#FF8000"
fi

exit 0
