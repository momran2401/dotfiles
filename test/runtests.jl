#!/usr/bin/env julia
#
# Copyright 2020-2026 John T. Foster
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
using Test

@testset "TestSolution" begin
    root_path = dirname(@__FILE__) * "/../"
    
    @testset "test_lla" begin
        first_line = readline(joinpath(root_path, "lla.txt"))
        split_line = split(strip(first_line))
        
        @test split_line[1] == "alias"
        @test split_line[2] == "lla='ls"
        @test split_line[3] == "-la'"
    end
end
