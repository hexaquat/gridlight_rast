--
-- Created by IntelliJ IDEA.
-- User: hexaquat
-- Date: 08/11/17
-- Time: 17:28
-- To change this template use File | Settings | File Templates.
--


State = {
    init = function(self) print("init") end,
    close = function(self) print("close") end,
    update = function(self, delta) print("update") end,
    draw = function(self, renderer) print("draw") end,
    render = function(self, renderer, delta) self:update(renderer,delta); self:draw(renderer); end,
}

Renderer.uniforms = {};


function Vertex:set_member(name, value)
    self.members[name] = value;
end


function State:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end


function Renderer:set_uniform(name, value)
    print("set uniform");
    self.uniforms[name] = value;
end


function Renderer:clear()
    Renderer.uniforms = {};
end



