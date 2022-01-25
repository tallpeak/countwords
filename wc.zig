// based on simple.zig from countwords
const std = @import("std");

pub fn main() !void {
    const stdin = std.io.bufferedReader(std.io.getStdIn().reader()).reader();
    var buf: [8192]u8 = undefined;
    var charCount : u64 = 0;
    var wordCount : u64 = 0;
    var lineCount : u64 = 0;
    while (try stdin.readUntilDelimiterOrEof(&buf, '\n')) |line| {
        lineCount += 1;
        for (line) |_| { 
            charCount += 1;
            //if (c == ' ') {  wordCount += 1; }
        }
        var it = std.mem.tokenize(u8, line, " ");
        while (it.next()) |_| {
            wordCount += 1;
        }
    }
    var stdout = std.io.bufferedWriter(std.io.getStdOut().writer());
    try stdout.writer().print("chars {d}\n", .{charCount} );
    try stdout.writer().print("words {d}\n", .{wordCount} );
    try stdout.writer().print("lines {d}\n", .{lineCount} );
    try stdout.flush();
}