library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- שימושית מאוד למערכות עם חישובים ומספרים (נלמד בהמשך):
-- use IEEE.NUMERIC_STD.ALL; 

entity [Your_Entity_Name] is
    Port ( 
           -- כניסות (Inputs)
           CLK    : in  STD_LOGIC; -- רלוונטי רק למערכות סינכרוניות
           RST    : in  STD_LOGIC; -- רלוונטי רק למערכות סינכרוניות
           DataIn : in  STD_LOGIC_VECTOR (7 downto 0);
           
           -- יציאות (Outputs)
           DataOut : out STD_LOGIC_VECTOR (7 downto 0)
    );
end [Your_Entity_Name];

architecture Behavioral of [Your_Entity_Name] is

    -- *** אזור הצהרות (Declarations) ***
    -- כאן מגדירים אותות פנימיים (Signals), קבועים (Constants) ורכיבים אחרים (Components)
    signal internal_sig : std_logic_vector(7 downto 0);

begin

    -- *** אזור הלוגיקה (Concurrent Statements) ***
    -- כל שורה כאן קורית במקביל לשורות האחרות!
    
    -- דוגמה ללוגיקה צירופית פשוטה:
    DataOut <= internal_sig;

    -- תהליך (Process) - לוגיקה מסובכת יותר או סינכרונית
    process(CLK, RST)
    begin
        if rising_edge(CLK) then
            -- כאן כותבים דברים שקורים בעליית שעון
        end if;
    end process;

end Behavioral;