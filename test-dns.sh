#!/bin/sh

success=0
failed=0
counter=0
host="ecs.eu-de.otc.t-systems.com"

start_time=$(date +'%Y-%m-%dT%H:%M:%SZ')
while [ $counter -lt 1000 ]; do
    if nslookup $host >/dev/null 2>&1; then
      success=$(($success + 1))
    else
      failed=$(($failed + 1))
    fi
      counter=$(($counter + 1))
    sleep 0.5
done
end_time=$(date +'%Y-%m-%dT%H:%M:%SZ')
if [ $counter -ne 0 ]; then
  success_rate=$(echo "scale=2; ($success / $counter) * 100" | bc)
else
  success_rate=100
fi

echo "[$start_time --- $end_time] Success: $success Failed: $failed Rate: $success_rate"
