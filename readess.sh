#!/bin/bash

password=d84fb802056d


essread () {
  output=$(esscli --password $password --action get_data | jq '.home.statistics.bat_user_soc')
  battery_level=${output:1:-1}
  iobroker state set 0_userdata.0.pv_data $battery_level
}

essread
sleep 30
essread