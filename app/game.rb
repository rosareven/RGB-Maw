Maw!

controls.define :reset, keyboard: :r

midx = (grid.w / 2) - 50
blocky = grid.h - 200

init {
    $state.background = [grid.rect, 236, 213, 121]
    $state.block = {
        x: midx, y: blocky, w: 100, h: 100, path:"sprites/square/white.png",
        a: 255, r: 0, g: 0, b: 0
    }
    $state.green ||= $state.new_entity(:green, $state.block.merge(g: 255))
    $state.red ||= $state.block.merge(x: midx/2, r: 255)
    $state.blue ||= $state.block.merge(x: midx+(midx/2), b: 255)
    
    $state.mouse_label = { x: 10, y: grid.h - 10 }
    $state.block_label = { x: grid.w/2, y: grid.h - 10, alignment_enum: 1}
}

tick {
    init if controls.reset_down?
    solids << $state.background
    sprites << $state.green
    sprites << $state.red
    sprites << $state.blue

    labels << $state.mouse_label.merge!(text: "X: "+mouse.x.to_s+" Y: "+mouse.y.to_s)
    if mouse.inside_rect? $state.green.rect
        labels << $state.block_label.merge!(text: $state.green.entity_type.to_s)
    end
}