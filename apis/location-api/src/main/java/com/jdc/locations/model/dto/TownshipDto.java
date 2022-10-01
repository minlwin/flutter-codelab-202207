package com.jdc.locations.model.dto;

import com.jdc.locations.model.entity.Township;

public record TownshipDto(
		int id,
		String name,
		int stateId,
		String stateName
) {

	public TownshipDto(Township tsh) {
		this(tsh.getId(), tsh.getName(), tsh.getState().getId(), tsh.getState().getName());
	}
}
