package com.jdc.locations.model.dto;

import com.jdc.locations.model.entity.State;

public record StateDto(
		int id,
		String name,
		String region,
		String capital
) {
	
	public StateDto(State state) {
		this(state.getId(), state.getName(), state.getRegion(), state.getCapital());
	}
}
