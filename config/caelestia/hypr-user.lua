hl.config({
    input = {
        kb_layout = "us,ru",
        kb_options = "grp:alt_shift_toggle",
    },
    decoration = {
        active_opacity = 0.88,
        inactive_opacity = 0.78,
    },
})


hl.on("hyprland.start", function()
    hl.exec_cmd("/home/maksim/.config/hypr/autolock.sh")
end)
