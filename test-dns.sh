#!/bin/sh

success=0
failed=0
counter=0
host="ecs.eu-de.otc.t-systems.com"

start_time=$(date +'%Y-%m-%dT%H:%M:%SZ')
start_timestamp=$(date +"%s")
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
end_timestamp=$(date +"%s")
if [ $counter -ne 0 ]; then
  success_rate=$(echo "scale=2; ($success / $counter) * 100" | bc)
else
  echo "[ERROR] loop did not run?"
fi

epoch_seconds=$((end_timestamp - start_timestamp))

echo "[$start_time --- $end_time] Success: $success Failed: $failed Rate: ${success_rate}% Epoch: ${epoch_seconds}s"
