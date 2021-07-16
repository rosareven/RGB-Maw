Maw!

controls.define :reset, keyboard: :r

midx = (grid.w / 2) - 50
blocky = grid.h - 200

init {
    $state.background = [grid.rect, 236, 213, 121]
    $state.green = {
        x: midx, y: blocky, w: 100, h: 100, path:"sprites/square/white.png",
        a: 255, r: 0, g: 255, b: 0
    }
    $state.red = {
        x: midx / 2, y: blocky, w: 100, h: 100, path:"sprites/square/white.png",
        a: 255, r: 255, g: 0, b: 0
    }
    $state.blue = {
        x: midx + (midx / 2), y: blocky, w: 100, h: 100, path:"sprites/square/white.png",
        a: 255, r: 0, g: 0, b: 255
    }
}

tick {
    init if controls.reset_down?
    solids << $state.background
    sprites << $state.green
    sprites << $state.red
    sprites << $state.blue
}