Maw!

controls.define :reset, keyboard: :r

midx = (grid.w / 2) - 50
blocky = grid.h - 200
blocks = Array.new

init {
    $state.background = [grid.rect, 236, 213, 121]
    $state.block = {
        x: midx, y: blocky, w: 100, h: 100, path:"sprites/square/white.png",
        a: 255, r: 0, g: 0, b: 0, name: ""
    }
    blocks << $state.green ||= $state.block.merge(g: 255, name: "Green")
    blocks << $state.red ||= $state.block.merge(x: midx/2, r: 255, name: "Red")
    blocks << $state.blue ||= $state.block.merge(x: midx+(midx/2), b: 255, name: "Blue")
    
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

    blocks.each do |e|
        if mouse.inside_rect? e.rect
            labels << $state.block_label.merge!(text: e.name)
        end
    end
}