package main 
import rl "vendor:raylib"
import "core:math/rand"

WINDOW_WIDTH :: 600
WINDOW_HEIGTH :: 600
FPS :: 60

main::proc()
{ 
    rl.SetConfigFlags(rl.ConfigFlags{ .WINDOW_RESIZABLE })
    rl.InitWindow(WINDOW_WIDTH, WINDOW_HEIGTH, "Particales")
    defer rl.CloseWindow()
    rl.SetTargetFPS(FPS)

    x: f32 = 400
    y: f32 = 250
    speed: f32 = 250
    direction_x :f32 = f32(rand.int_range(0,1)*2 - 1)
    direction_y :f32 = f32(rand.int_range(0,1)*2 - 1)
    for !rl.WindowShouldClose()
    {
        dt := rl.GetFrameTime()
        if rl.IsKeyDown(rl.KeyboardKey.Q)   do rl.CloseWindow()
        x += speed * dt * direction_x
        y += speed * dt * direction_y

        if x+30 >= WINDOW_WIDTH || x-30 <= 0 do direction_x *= -1
        if y+30 >= WINDOW_HEIGTH || y-30 <= 0 do direction_y *= -1
        rl.BeginDrawing()
        defer rl.EndDrawing()
        rl.ClearBackground(rl.RAYWHITE)
        rl.DrawText("Hello from odin + raylib", 20, 20, 24, rl.BLACK)
        rl.DrawCircleV(rl.Vector2{x,y}, 30, rl.BLUE)
    }
}
