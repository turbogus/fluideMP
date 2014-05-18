--Mod : signalisation
--Créé par turbogus
--Licence graphique & code : GPL2 ou supérieur
--Description : Ajoute des panneaux de signalisation


--Panneaux danger lave

	minetest.register_node("signalisation:panneau_danger_lave", {
		description = "Panneau de signalisation de danger lave",
		drawtype = "signlike",
		tiles = {"panneau_danger_lave.png"},
		inventory_image = "panneau_danger_lave.png",
		wield_image = "panneau_danger_lave.png",
	
		paramtype = "light",
		paramtype2 = "wallmounted",
	
		sunlight_propagates = true,
		walkable = false,
	
		selection_box = {
			type = "wallmounted",	
		},
		groups = {choppy=2,dig_immediate=2},
		legacy_wallmounted = true,
	})
	
	minetest.register_craft({
		output = "signalisation:panneau_danger_lave 3",
		recipe = {
			{'default:wood', 'default:wood', 'default:wood'},
			{'default:wood', 'default:sand', 'default:wood'},
			{'', 'default:stick', ''},
		}
	})
	
-- Bloc jaune & noir

	minetest.register_node("signalisation:bloc_jaune_noir", {
		description = "Bloc de signalisation jaune et noir",
		tiles = {"bloc_jaune_noir.png"},
		is_ground_content = false,
		walkable = true,
		pointable = true,
		diggable = true,
		groups = {cracky=2,crumbly=3},
		drop = "signalisation:bloc_jaune_noir",
		sounds = ({
		footstep = {name="poc", gain=0.25},
		dug = {name="poc", gain=0.75},
	}),
	})

	minetest.register_craft({
		output = 'signalisation:bloc_jaune_noir 4',
		recipe = {
			{'dye:yellow','dye:black' },
			{ 'dye:black','dye:yellow'},
		
			}
	})
