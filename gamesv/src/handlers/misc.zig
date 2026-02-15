const std = @import("std");
const pb = @import("proto").pb;
const network = @import("../network.zig");
const State = @import("../network/State.zig");
const Memory = State.Memory;
const Assets = @import("../data/Assets.zig");
const PlayerBasicComponent = @import("../logic/component/player/PlayerBasicComponent.zig");

pub fn onGetMiscDataCsReq(
    txn: *network.Transaction(pb.GetMiscDataCsReq),
    mem: Memory,
    assets: *const Assets,
    basic_comp: *PlayerBasicComponent,
) !void {
    errdefer txn.respond(.{ .retcode = 1 }) catch {};
    const templates = &assets.templates;

    var data: pb.MiscData = .{
        .business_card = .{},
        .player_accessory = .{
            .control_guise_avatar_id = basic_comp.info.control_guise_avatar_id,
        },
        .post_girl = .{},
    };

    for (templates.post_girl_config_template_tb.payload.data) |template| {
        try data.post_girl.?.post_girl_item_list.append(mem.arena, .{ .id = @intCast(template.id) });
    }
    try data.post_girl.?.show_post_girl_id_list.append(mem.arena, 3590001);

    var unlocked_list = try mem.arena.alloc(i32, templates.unlock_config_template_tb.payload.data.len);
    for (templates.unlock_config_template_tb.payload.data, 0..) |template, i| {
        unlocked_list[i] = @intCast(template.id);
    }
    data.unlock = .{ .unlocked_list = .fromOwnedSlice(unlocked_list) };

    var teleport_list = try mem.arena.alloc(i32, templates.teleport_config_template_tb.payload.data.len);
    for (templates.teleport_config_template_tb.payload.data, 0..) |template, i| {
        teleport_list[i] = @intCast(template.teleport_id);
    }
    data.teleport = .{ .unlocked_list = .fromOwnedSlice(teleport_list) };

    try txn.respond(.{ .data = data });
}

const usm_keys: []const pb.MapEntry(u32, u64) = &.{
    .{ .key = 2570, .value = 15259010423462933427 },
    .{ .key = 2466, .value = 8702115569357817493 },
    .{ .key = 2531, .value = 4257951510558629830 },
    .{ .key = 2532, .value = 12528959072272708846 },
    .{ .key = 2564, .value = 15999317281178507525 },
    .{ .key = 2566, .value = 15987295174799927409 },
    .{ .key = 2533, .value = 11561446229961895555 },
    .{ .key = 2563, .value = 17703087493133519243 },
    .{ .key = 2569, .value = 8294158829540574718 },
    .{ .key = 2562, .value = 4230571604426115633 },
    .{ .key = 2559, .value = 2979250444567898105 },
    .{ .key = 2528, .value = 375470177504018724 },
    .{ .key = 2530, .value = 10508062696221220705 },
    .{ .key = 2565, .value = 9644230727174596775 },
    .{ .key = 2458, .value = 7451714203198873009 },
    .{ .key = 2561, .value = 1955100867254013431 },
    .{ .key = 2529, .value = 13968483637407856949 },
    .{ .key = 2534, .value = 2921484915745029756 },
    .{ .key = 2460, .value = 399534112198758385 },
    .{ .key = 2567, .value = 12623443993576490497 },
    .{ .key = 2560, .value = 4918860462171001811 },
    .{ .key = 2568, .value = 3941200226474834056 },
};

pub fn onVideoGetInfoCsReq(
    txn: *network.Transaction(pb.VideoGetInfoCsReq),
) !void {
    errdefer txn.respond(.{ .retcode = 1 }) catch {};

    try txn.respond(.{
        .retcode = 0,
        .video_key_map = .{
            .capacity = usm_keys.len,
            .items = @constCast(usm_keys),
        },
    });
}
