--Mod : panneau
--Créé par turbogus
--Licence graphique & code : GPL2 ou supérieur
--Description : Ajoute des panneaux de signalisation


--Panneaux danger lave

	minetest.register_node("panneaux:panneau_danger_lave", {
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
		output = "panneaux:panneau_danger_lave 3",
		recipe = {
			{'default:wood', 'default:wood', 'default:wood'},
			{'default:wood', 'default:sand', 'default:wood'},
			{'', 'default:stick', ''},
		}
	})
