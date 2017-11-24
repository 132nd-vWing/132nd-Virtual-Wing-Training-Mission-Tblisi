-- Create the TRMT table
--
-- MOOSE does not like working with local variables, and having wild globals wandering the scope is bad practice anyway.
-- The TRMT table should hold *all* values that are needed outside of their local scope (i.e. anyhting that is not temporary).
-- Sub-tables can be declared for specialised scripts (e.g. "TRMT.TANKERS", "TRMT.RANGES", ...)
TRMT = {}

-- DEBUG
--
-- This section declares a few utility functions that hooks into the "dcs.log" file.
-- Every output should use those function, as they allow for a uniform logging format.
-- A simple search for "TRMT" in "dcs.log" will show everything that is related to the TRMT.
-- Same goes for "TRMT.WARNING", or "ERROR".
--
-- Specialized logger can be created for specialized scripts; for example, the little function below will re-use "TRMT.DEBUG",
-- and simply and "TANKER:" in front of "some_text":
-- 
-- > TRMT.TANKERS = {}
-- >
-- > TRMT.TANKERS.DEBUG = function(some_text)
-- >   TRMT.DEBUG("TANKER:", some_text)
-- > end
-- 
-- 
do

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
      if not routines == nil and type(v) == 'table' then
        result = result .. routines.utils.oneLineSerialize(v) .. "\n"
      else
        result = result .. tostring(v) .. "\n"
      end
    end
    return result
  end

  -- The debug function should 
  TRMT.DEBUG = function(...)
    if TRMT.LOG_LEVEL >= 4 then
      env.info('TRMT:DEBUG:' .. TRMT._debug_serialize(unpack(arg)))
    end
  end
  
  TRMT.INFO = function(...)
    if TRMT.LOG_LEVEL >= 3 then
      env.info('TRMT:INFO:' .. TRMT._debug_serialize(unpack(arg)))
    end
  end
  
  TRMT.WARN = function(...)
    if TRMT.LOG_LEVEL >= 2 then
      env.info('TRMT:WARNING: ' .. TRMT._debug_serialize(unpack(arg)))
    end
  end
  
  TRMT.WARNING = TRMT.WARN
  
  TRMT.ERROR = function(...)
    if TRMT.LOG_LEVEL >= 1 then
      env.info('TRMT:ERROR:' .. TRMT._debug_serialize(unpack(arg)))
    end
  end
end
