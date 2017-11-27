if env == nil then
    print('TRMT: WARNING:creating a dummy "env" for debugging purpose')
    env = { info = print }
end

-- Create the TRMT table
--
-- MOOSE does not like working with local variables, and having wild globals wandering the scope is bad practice anyway.
-- The TRMT table should hold *all* values that are needed outside of their local scope (i.e. anyhting that is not temporary).
-- Sub-tables can be declared for specialised scripts (e.g. "TRMT.TANKERS", "TRMT.RANGES", ...)
TRMT = {
    _class_id = 0,
}

-- porting in Slmod's serialize_slmod2
TRMT.one_line_serialize = function(tbl)  -- serialization of a table all on a single line, no comments, made to replace old get_table_string function
    lookup_table = {}    
    local function __serialize( tbl )
        if type(tbl) == 'table' then        
            if lookup_table[tbl] then return lookup_table[object] end
            local tbl_str = {}
            lookup_table[tbl] = tbl_str
            tbl_str[#tbl_str + 1] = '{'
            for ind,val in pairs(tbl) do -- serialize its fields
                local ind_str = {}
                if type(ind) == "number" then
                    ind_str[#ind_str + 1] = '['
                    ind_str[#ind_str + 1] = tostring(ind)
                    ind_str[#ind_str + 1] = ']='
                else --must be a string
                    ind_str[#ind_str + 1] = '['
                    ind_str[#ind_str + 1] = TRMT.basic_serialize(ind)
                    ind_str[#ind_str + 1] = ']='
                end
                local val_str = {}
                if ((type(val) == 'number') or (type(val) == 'boolean')) then
                    val_str[#val_str + 1] = tostring(val)
                    val_str[#val_str + 1] = ','
                    tbl_str[#tbl_str + 1] = table.concat(ind_str)
                    tbl_str[#tbl_str + 1] = table.concat(val_str)
                elseif type(val) == 'string' then
                    val_str[#val_str + 1] = TRMT.basic_serialize(val)
                    val_str[#val_str + 1] = ','
                    tbl_str[#tbl_str + 1] = table.concat(ind_str)
                    tbl_str[#tbl_str + 1] = table.concat(val_str)
                elseif type(val) == 'nil' then -- won't ever happen, right?
                    val_str[#val_str + 1] = 'nil,'
                    tbl_str[#tbl_str + 1] = table.concat(ind_str)
                    tbl_str[#tbl_str + 1] = table.concat(val_str)
                elseif type(val) == 'table' then
                    if ind == "__index" then
                    --    tbl_str[#tbl_str + 1] = "__index"
                    --    tbl_str[#tbl_str + 1] = ','   --I think this is right, I just added it
                    else
                        val_str[#val_str + 1] = __serialize(val)
                        val_str[#val_str + 1] = ','   --I think this is right, I just added it
                        tbl_str[#tbl_str + 1] = table.concat(ind_str)
                        tbl_str[#tbl_str + 1] = table.concat(val_str)
                    end
                elseif type(val) == 'function' then
                    -- tbl_str[#tbl_str + 1] = "function " .. tostring(ind)
                    -- tbl_str[#tbl_str + 1] = ','   --I think this is right, I just added it
                else
                    -- env.info('unable to serialize value type ' .. TRMT.basic_serialize(type(val)) .. ' at index ' .. tostring(ind))
                    -- env.info( debug.traceback() )
                end    
            end
            tbl_str[#tbl_str + 1] = '}'
            return table.concat(tbl_str)
        else
          if type(tbl) == 'string' then return tbl else return tostring(tbl) end
        end
    end
    local objectreturn = __serialize(tbl)
    return objectreturn
end

--porting in Slmod's "safestring" basic serialize
TRMT.basic_serialize = function(s)
    if s == nil then return "\"\""
    else
        if ((type(s) == 'number') or (type(s) == 'boolean') or (type(s) == 'function') or (type(s) == 'table') or (type(s) == 'userdata') ) then return tostring(s)
        elseif type(s) == 'string' then return string.format('%s', s:gsub( "%%", "%%%%" ) ) end
    end
end

-- Defines the amount of information that will be printed to the log
-- 
-- Different log levels are used:
--
-- 4: DEBUG: all information
-- 3: INFO: most important information only
-- 2: WARNING: only warnings and errors
-- 1: ERROR: errors only
-- 0: MUTED: no logging from the TRMT at all

TRMT.LOG_LEVEL = 4

-- This is internal function to transform tables into readable strings using Slmod logic that's implemented
-- into Moose; feel free to ignore it. If Moose is not present, the tables will no be printed as text.
TRMT._debug_serialize = function(...)
    local result = ''
    for i, v in ipairs(arg) do
        if type(v) == 'table' then result = result .. TRMT.one_line_serialize(v) .. "\n"
        else result = result .. tostring(v) .. "\n"
        end
    end
    return result
end

TRMT._generic_debug = function(level_no, level_name, msg)
    local msg = string.format('TRMT:%8s:%s', level_name, msg)
    if TRMT.LOG_LEVEL >= level_no then env.info(msg); return msg end
end

-- The debug function should 
TRMT.DEBUG =    function(msg) return TRMT._generic_debug(4, 'DEBUG',    msg) end
TRMT.INFO =     function(msg) return TRMT._generic_debug(3, 'INFO',     msg) end
TRMT.WARN =     function(msg) return TRMT._generic_debug(2, 'WARNING',  msg) end
TRMT.ERROR =    function(msg) return TRMT._generic_debug(1, 'ERROR',    msg) end
TRMT.CRITICAL = function(msg) return TRMT._generic_debug(0, 'CRITICAL', msg) end
TRMT.WARNING = TRMT.WARN


--from http://lua-users.org/wiki/CopyTable
TRMT.deep_copy = function(object)
    local lookup_table = {}
    local function _copy(object)
        if type(object) ~= "table" then
            return object
        elseif lookup_table[object] then
            return lookup_table[object]
        end
        local new_table = {}
        lookup_table[object] = new_table
        for index, value in pairs(object) do
            new_table[_copy(index)] = _copy(value)
        end
        return setmetatable(new_table, getmetatable(object))
    end
    local objectreturn = _copy(object)
    return objectreturn
end

TRMT.BASE = {
    class_name = 'BASE',
    class_id = 0,
    __ = {},
    _ = {},
}

function TRMT.BASE:New()
    local self = TRMT.deep_copy( self )
    TRMT._class_id = TRMT._class_id + 1
    self.class_id = TRMT._class_id
    return self
end

function TRMT.BASE:debug(msg)
    return TRMT.DEBUG(self.class_name..':'..TRMT.one_line_serialize(msg))
end

function TRMT.BASE:info(msg)
    return TRMT.INFO(self.class_name..':'..TRMT.one_line_serialize(msg))
end

function TRMT.BASE:warning(msg)
    return TRMT.WARN(self.class_name..':'..TRMT.one_line_serialize(msg))
end

function TRMT.BASE:warn(msg)
    return TRMT.WARN(self.class_name..':'..TRMT.one_line_serialize(msg))
end

function TRMT.BASE:error(msg)
    return TRMT.ERROR(self.class_name..':'..TRMT.one_line_serialize(msg))
end

function TRMT.BASE:critical(msg)
    return TRMT.CRITICAL(self.class_name..':'..TRMT.one_line_serialize(msg))
end

function TRMT.BASE:subclass_of( child, base_class )
    local child = TRMT.deep_copy( child )
    local parent = base_class:New()
    if child ~= nil then
        if rawget( child, "__" ) then
            setmetatable( child, { __index = child.__  } )
            setmetatable( child.__, { __index = parent } )
        else setmetatable( child, { __index = parent } ) end
    end
    return child
end

TRMT._get_parent = function( child )
    local parent = nil

    if child.class_name == 'BASE' then parent = nil
    else
        if rawget( child, "__" ) then parent = getmetatable( child.__ ).__index
        else parent = getmetatable( child ).__index
        end 
    end
    return parent
end

function TRMT.BASE:get_parent( base_class )


    local parent
    -- BASE class has no parent
    if self.class_name == 'BASE' then return nil
    else
        self:debug({base_class = base_class})
        self:debug({self = self.class_name})
        if base_class then
            while( self.class_name ~= "BASE" and self.class_name ~= base_class.class_name ) do
                self = TRMT._get_parent( self )
                self:debug({self.class_name})
            end
        end  
        if self.class_name == 'BASE' then parent = nil
        else parent = TRMT._get_parent( self )
        end
    end
    self:debug({parent.class_name})
    return parent
end

function TRMT.BASE:isinstance( class_name )
    if type( class_name ) ~= 'string' then
        if type( class_name ) == 'table' and class_name.class_name ~= nil then class_name = class_name.class_name
        else
            local err_str = 'className parameter should be a string; parameter received: '..type( class_name )
            self:error( err_str )
            -- error( err_str )
            return false
        end
    end

    class_name = string.upper( class_name )
    if string.upper( self.class_name ) == class_name then return true end

    local parent = get_parent(self)
    while parent do
        if string.upper( parent.class_name ) == class_name then return true end
        parent = get_parent( parent )
    end

    return false

end

local b = TRMT.BASE:New()
assert(b.class_name == 'BASE', b.class_name)
assert(b:isinstance('BASE'))
assert(b:get_parent(b) == nil, b:get_parent(b))

assert(b:debug('test') == 'TRMT:   DEBUG:BASE:test', b:debug('test'))
assert(b:info('test') == 'TRMT:    INFO:BASE:test', b:info('test'))
assert(b:warn('test') == 'TRMT: WARNING:BASE:test', b:warn('test'))
assert(b:warning('test') == 'TRMT: WARNING:BASE:test', b:warning('test'))
assert(b:error('test') == 'TRMT:   ERROR:BASE:test', b:error('test'))
assert(b:critical('test') == 'TRMT:CRITICAL:BASE:test', b:critical('test'))

TRMT.TEST_CLASS1 = {
    class_name = 'TEST_CLASS1',
}

function TRMT.TEST_CLASS1:New()
    return TRMT.BASE:subclass_of( self, TRMT.BASE ) 
end

local t1 = TRMT.TEST_CLASS1:New()
assert(t1.class_name == 'TEST_CLASS1', t1.class_name)
assert(t1:get_parent() ~= nil, TRMT.one_line_serialize(t1:get_parent()))
assert(t1:get_parent().class_name == 'BASE', TRMT.one_line_serialize(t1:get_parent()))

TRMT.TEST_CLASS2 = {
    class_name = 'TEST_CLASS2',
}

function TRMT.TEST_CLASS2:New()
    return TRMT.BASE:subclass_of( self, TRMT.TEST_CLASS1 ) 
end

local t2 = TRMT.TEST_CLASS2:New()
assert(t2.class_name == 'TEST_CLASS2', t2.class_name)
assert(t2:get_parent() ~= nil, TRMT.one_line_serialize(t2:get_parent()))
assert(t2:get_parent().class_name == 'TEST_CLASS1', TRMT.one_line_serialize(t2:get_parent()))
