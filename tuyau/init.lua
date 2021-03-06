-- tuyau

--créé par turbogus et rerem

-- code licence gpl v2 ou superieur
-- graphisme sous licence CC-BY-NC-SA

-----------------
--Tuyau vide
-----------------

--Déclaration du tuyau vide :

minetest.register_node("tuyau:tuyau", {
	description = "tuyau",
	drawtype = "glasslike_framed_optional",
	tiles = {"tuyau.png"},
	paramtype = "light",
	light_source = LIGHT_MAX - 10,
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = true,
	diggable = true,
	drop = 'tuyau:tuyau',
	groups = {crumbly=3},
	sounds =  default.node_sound_glass_defaults(),
	
})

-- Craft du tuyau vide :

minetest.register_craft({
	output = "tuyau:tuyau",
	recipe = {
		{'default:glass', 'default:glass', 'default:glass'},
		{'default:glass', '', 'default:glass'},
		{'default:glass', 'default:glass', 'default:glass'},
	}
})

-- Gestion

minetest.register_abm({
	nodenames = {"tuyau:tuyau"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local pos2={x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.env:get_node(pos2).name=="tuyau:pompe_water" then
			minetest.env:add_node(pos, {name="tuyau:tuyau_water"})
		elseif minetest.env:get_node(pos2).name=="tuyau:pompe_lava" then
			minetest.env:add_node(pos, {name="tuyau:tuyau_lava"})
		else
			local pos1={x=pos.x, y=pos.y+1, z=pos.z}
			local pos3={x=pos.x+1, y=pos.y, z=pos.z}
			local pos4={x=pos.x-1, y=pos.y, z=pos.z}
			local pos5={x=pos.x, y=pos.y, z=pos.z+1}
			local pos6={x=pos.x, y=pos.y, z=pos.z-1}
			
			if minetest.env:get_node(pos1).name=="tuyau:tuyau_water" or minetest.env:get_node(pos2).name=="tuyau:tuyau_water" or minetest.env:get_node(pos3).name=="tuyau:tuyau_water" or minetest.env:get_node(pos4).name=="tuyau:tuyau_water" or minetest.env:get_node(pos5).name=="tuyau:tuyau_water" or minetest.env:get_node(pos6).name=="tuyau:tuyau_water" then
				minetest.env:add_node(pos, {name="tuyau:tuyau_water"})
			elseif minetest.env:get_node(pos1).name=="tuyau:tuyau_lava" or minetest.env:get_node(pos2).name=="tuyau:tuyau_lava" or minetest.env:get_node(pos3).name=="tuyau:tuyau_lava" or minetest.env:get_node(pos4).name=="tuyau:tuyau_lava" or minetest.env:get_node(pos5).name=="tuyau:tuyau_lava" or minetest.env:get_node(pos6).name=="tuyau:tuyau_lava" then
				minetest.env:add_node(pos, {name="tuyau:tuyau_lava"})
			end	
		end
	end,

})

-----------------
--Tuyau remplis
-----------------

--Déclaration du tuyau d'eau :

minetest.register_node("tuyau:tuyau_water", {
	description = "tuyau d'eau",
	tiles = {"tuyau_water.png"},
	is_ground_content = false,
	walkable = true,
	diggable = true,
	drop = 'tuyau:tuyau',
	groups = {crumbly=3},
	sounds =  default.node_sound_glass_defaults(),
})

--Gestion (passage OFF du bloc si en contact avec autre bloc OFF)
--[[
minetest.register_abm({
	nodenames = {"tuyau:tuyau_water"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		
	end,
})
]]--
--Déclaration du tuyau de lave :

minetest.register_node("tuyau:tuyau_lava", {
	description = "tuyau de lave",
	tiles = {"tuyau_lava.png"},
	is_ground_content = false,
	walkable = true,
	diggable = true,
	drop = 'tuyau:tuyau',
	groups = {crumbly=3},
	sounds =  default.node_sound_glass_defaults(),
})

--Gestion (passage OFF du bloc si en contact avec autre bloc OFF)
--[[
minetest.register_abm({
	nodenames = {"tuyau:tuyau_lava"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		
	end,
})
]]--
-----------------
--Pompe
-----------------

--Déclaration de la pompe :

minetest.register_node("tuyau:pompe", {
	description = "pompe",
	tiles = {"pompe2_dessus_dessous.png","pompe2_dessus_dessous.png","pompe2_cote_off.png","pompe2_cote_off.png","pompe2_cote_off.png","pompe2_cote_off.png"},
	is_ground_content = false,
	walkable = true,
	diggable = true,
	drop = 'tuyau:pompe',
	groups = {crumbly=3},
	sounds = default.node_sound_stone_defaults(),
})

-- Craft de la pompe vide :

minetest.register_craft({
	output = "tuyau:pompe",
	recipe = {
		{'default:steel_ingot', 'default:mese_fragment', 'default:steel_ingot'},
		{'default:mese_fragment', '', 'default:mese_fragment_fragment'},
		{'default:steel_ingot', 'default:mese', 'default:steel_ingot'},
	}
})

--Déclaration de la pompe d'eau :

minetest.register_node("tuyau:pompe_water", {
	description = "pompe d'eau",
	tiles = {"pompe2_dessus_dessous.png","pompe2_dessus_dessous.png","pompe2_cote_on.png","pompe2_cote_on.png","pompe2_cote_on.png","pompe2_cote_on.png"},
	is_ground_content = false,
	walkable = true,
	diggable = true,
	drop = 'tuyau:pompe',
	groups = {crumbly=3},
	sounds = default.node_sound_stone_defaults(),
})

--Déclaration de la pompe de lave :

minetest.register_node("tuyau:pompe_lava", {
	description = "pompe de lave",
	tiles = {"pompe2_dessus_dessous.png","pompe2_dessus_dessous.png","pompe2_cote_on.png","pompe2_cote_on.png","pompe2_cote_on.png","pompe2_cote_on.png"},
	is_ground_content = false,
	walkable = true,
	diggable = true,
	drop = 'tuyau:pompe',
	groups = {crumbly=3},
	sounds = default.node_sound_stone_defaults(),
})

-- Gestion

minetest.register_abm({
	nodenames = {"tuyau:pompe"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local pos2={x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.env:get_node(pos2).name=="default:water_source" or minetest.env:get_node(pos2).name=="default:water_flowing" then
			minetest.env:add_node(pos, {name="tuyau:pompe_water"})
		elseif minetest.env:get_node(pos2).name=="default:lava_source" or minetest.env:get_node(pos2).name=="default:lava_flowing" then
			minetest.env:add_node(pos, {name="tuyau:pompe_lava"})
		end
	end,
})

minetest.register_abm({
	nodenames = {"tuyau:pompe_water"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local pos2={x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.env:get_node(pos2).name~="default:water_source" and minetest.env:get_node(pos2).name~="default:water_flowing" then
			minetest.env:add_node(pos, {name="tuyau:pompe"})
		end
	end,
})

minetest.register_abm({
	nodenames = {"tuyau:pompe_lava"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local pos2={x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.env:get_node(pos2).name~="default:lava_source" and minetest.env:get_node(pos2).name~="default:lava_flowing" then
			minetest.env:add_node(pos, {name="tuyau:pompe"})
		end
	end,
})

-----------------
--Sortie
-----------------

--Déclaration de la sortie :

minetest.register_node("tuyau:sortie", {
	description = "sortie",
	tiles = {"pompe2_dessus_dessous.png", "pompe2_dessus_dessous.png", "sortie_off.png", "sortie_off.png", "sortie_off.png", "sortie_off.png"},
	is_ground_content = false,
	walkable = true,
	diggable = true,
	drop = 'tuyau:sortie',
	groups = {crumbly=3},
	sounds = default.node_sound_stone_defaults(),
})

-- Craft de la sortie :

minetest.register_craft({
	output = "tuyau:sortie",
	recipe = {
		{'default:glass', 'default:glass', 'default:glass'},
		{'default:glass', '', 'default:glass'},
		{'default:steel_ingot', '', 'default:steel_ingot'},
	}
})

--Déclaration de la sortie d'eau :

minetest.register_node("tuyau:sortie_water", {
	description = "sortie d'eau",
	tiles = {"pompe2_dessus_dessous.png", "pompe2_dessus_dessous.png", "sortie_on.png", "sortie_on.png", "sortie_on.png", "sortie_on.png"},
	is_ground_content = false,
	walkable = true,
	diggable = true,
	drop = 'tuyau:sortie',
	groups = {crumbly=3},
	sounds = default.node_sound_stone_defaults(),
})

--Déclaration de la sortie de lave :

minetest.register_node("tuyau:sortie_lava", {
	description = "sortie de lave",
	tiles = {"pompe2_dessus_dessous.png", "pompe2_dessus_dessous.png", "sortie_on.png", "sortie_on.png", "sortie_on.png", "sortie_on.png"},
	is_ground_content = false,
	walkable = true,
	diggable = true,
	drop = 'tuyau:sortie',
	groups = {crumbly=3},
	sounds = default.node_sound_stone_defaults(),
})

-- Gestion

minetest.register_abm({
	nodenames = {"tuyau:sortie"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local pos2 = {x=pos.x, y=pos.y+1, z=pos.z}
		local pos3 = {x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.env:get_node(pos2).name=="tuyau:tuyau_water" then
			minetest.env:add_node(pos, {name="tuyau:sortie_water"})
		elseif minetest.env:get_node(pos2).name=="tuyau:tuyau_lava" then
			minetest.env:add_node(pos, {name="tuyau:sortie_lava"})
		end
	end,
})

minetest.register_abm({
	nodenames = {"tuyau:sortie_water"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local pos2 = {x=pos.x, y=pos.y+1, z=pos.z}
		local pos3 = {x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.env:get_node(pos2).name~="tuyau:tuyau_water" then
			minetest.env:add_node(pos, {name="tuyau:sortie"})
			minetest.env:add_node(pos3, {name="air"})
		else
			
			if minetest.env:get_node(pos3).name=="air" then
				minetest.env:add_node(pos3, {name="default:water_source"})
			end
		end
	end,
})

minetest.register_abm({
	nodenames = {"tuyau:sortie_lava"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local pos2 = {x=pos.x, y=pos.y+1, z=pos.z}
		local pos3 = {x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.env:get_node(pos2).name~="tuyau:tuyau_lava" then
			minetest.env:add_node(pos, {name="tuyau:sortie"})
			minetest.env:add_node(pos3, {name="air"})
		else
			if minetest.env:get_node(pos3).name=="air" then
				minetest.env:add_node(pos3, {name="default:lava_source"})
			end
		end
	end,
})

minetest.register_on_dignode(function(pos, node)
	if node.name=="tuyau:sortie_water" then
		local pos2 = {x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.env:get_node(pos2).name=="default:water_source" then
			minetest.env:add_node(pos2, {name="air"})
		end
	
	elseif node.name=="tuyau:sortie_lava" then
		local pos2 = {x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.env:get_node(pos2).name=="default:lava_source" then
			minetest.env:add_node(pos2, {name="air"})
		end
	end	
end
)
