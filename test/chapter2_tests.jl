
@testset "device temperature model predicts temperature at processor power ratings" begin
  tmps = [30, 60, 70, 65]
  pwrs = [[10, 10, 10],
          [100, 10, 10],
          [10, 100, 10],
          [10, 10, 100]]
  for i = 1:4
    @test device_temperature_model(pwrs[i]) == tmps[i]
  end
end

@testset "maximum processor power to keep device temperature below ceiling" begin
    pwr_tmps = [(pwr, device_temperature_model([pwr,pwr,pwr])) for pwr = 10:100]
    @testset "maximum power should be based on temperature model" begin
      for pwr_tmp in pwr_tmps
        @test device_max_power_at_temp_ceiling(pwr_tmp[2]) == pwr_tmp[1]
      end
    end
    @testset "maximum power should not exceed 100" begin
      @test device_max_power_at_temp_ceiling(pwr_tmps[end][2]+1) == 100
    end
    @testset "maximum power should not be less than idle power" begin
      @test device_max_power_at_temp_ceiling(pwr_tmps[1][2]-1) == 10
    end
end
