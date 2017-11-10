--
-- Created by IntelliJ IDEA.
-- User: hexaquat
-- Date: 08/11/17
-- Time: 17:36
-- To change this template use File | Settings | File Templates.
--



main_state = State:new();
state = main_state;

function main_state:init()
    print("main_init");
    self.projection = 2;
    self.model_view = 1;
    self.model = Model.new();
    p1 = Vector3.new();
    p1.x = 0;
    p1.y = -1;
    p1.z = 0;
    p2 = Vector3.new();
    p2.x = 3;
    p2.y = -1;
    p2.z = 0;
    p3 = Vector3.new();
    p3.x = 3;
    p3.y = 3;
    p3.z = 0;
    self.model.positions[1] = p1;
    self.model.positions[2] = p2;
    self.model.positions[3] = p3;
    self.model.indices[1] = 0;
    self.model.indices[2] = 1;
    self.model.indices[3] = 2;
end

function main_state:update(renderer,delta)
    print("main_update","");
    rot = Matrix4.new();
    rot:set_identity();
    rot:rot_x(delta*5);
    rot = rot * self.model.model_matrix;
    self.model.model_matrix:set(rot);
    renderer:set_uniform("projection", renderer:get_frustum():get_projection());
    renderer:set_uniform("view", renderer:get_camera():world_to_camera());
    renderer:set_uniform("model_matrix", self.model.model_matrix);
    renderer:draw(self.model);
end

function main_state:close()
    print("main_close");
end
