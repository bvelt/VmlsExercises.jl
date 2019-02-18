
# Exercise 2.2 Processor powers and temperatures

# temperature when all three processors at idle
tmp_idle = 30
# temperatures when processor at index i at full power and others at idle
tmp_full = [60, 70, 65]
# increase in temperature when processor at index i at full power
tmp_incrs = tmp_full .- tmp_idle

# power rating at idle
pwr_idle = 10
# power rating at full
pwr_full = 100
# rating increase when going from idle to full
pwr_incr = pwr_full - pwr_idle

# ratio of temperature increase to power increase for each processor at index i
pwr_weights = [tmp_incr//pwr_incr for tmp_incr in tmp_incrs]

# solve for offset with regressors and idle state
tmp_offset = tmp_idle - [pwr_idle for _=1:3]'*pwr_weights

# linear regression that returns device temperature at processor power ratings
device_temperature_model(processor_pwrs) = processor_pwrs'*pwr_weights + tmp_offset

# maximum power for all processors to keep device temperature at or below specified ceiling
function device_max_power_at_temp_ceiling(tmp_ceiling)
    pwr_ceiling = 10
    for pwr = 10:100
        tmp = device_temperature_model([pwr for _=1:3])
        if tmp <= tmp_ceiling
            pwr_ceiling = pwr
        else
            break
        end
    end
    return pwr_ceiling
end
