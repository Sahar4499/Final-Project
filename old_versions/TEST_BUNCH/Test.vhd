library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- ה-Entity של טסט תמיד ריק!
entity TB_[Your_Entity_Name] is
end TB_[Your_Entity_Name];

architecture Behavioral of TB_[Your_Entity_Name] is

    -- 1. הצהרת הרכיב הנבדק (Component Declaration)
    -- מעתיקים לכאן את ה-Entity מהקובץ המקורי ומחליפים את המילה entity ב-component
    component [Your_Entity_Name] is
    Port ( 
           CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           DataIn : in STD_LOGIC_VECTOR (7 downto 0);
           DataOut : out STD_LOGIC_VECTOR (7 downto 0)
    );
    end component;
    
    -- 2. הגדרת אותות לחיבור (Signals)
    -- חובה: לאתחל כניסות כדי שלא יהיו 'U' (Unknown)
    signal clk_tb : std_logic := '0';
    signal rst_tb : std_logic := '0';
    signal data_in_tb : std_logic_vector(7 downto 0) := (others => '0');
    
    -- ליציאות לא נותנים ערך התחלתי
    signal data_out_tb : std_logic_vector(7 downto 0);

    -- הגדרת זמן מחזור שעון (אם צריך)
    constant CLK_PERIOD : time := 10 ns;

begin

    -- 3. חיבור הרכיב (Instantiation / Port Map)
    -- צד שמאל: שם הפין ברכיב המקורי => צד ימין: האות בטסט שמתחבר אליו
    UUT: [Your_Entity_Name] Port Map (
        CLK => clk_tb,
        RST => rst_tb,
        DataIn => data_in_tb,
        DataOut => data_out_tb
    );

    -- 4. יצירת שעון (Clock Generation) - רק אם צריך
    clk_process : process
    begin
        clk_tb <= '0';
        wait for CLK_PERIOD/2;
        clk_tb <= '1';
        wait for CLK_PERIOD/2;
    end process;

    -- 5. תהליך הגירוי (Stimulus Process) - כאן בודקים את המערכת!
    stim_proc: process
    begin		
        -- אתחול ראשוני
        rst_tb <= '1'; -- נניח שאנחנו מאפסים בהתחלה
        wait for 20 ns;	
        rst_tb <= '0';
        wait for 20 ns;

        -- מקרה בדיקה 1
        data_in_tb <= "00001111";
        wait for CLK_PERIOD; -- מחכים מחזור שעון

        -- מקרה בדיקה 2
        data_in_tb <= "11110000";
        wait for CLK_PERIOD;

        wait; -- עוצר את הסימולציה בסוף
    end process;

end Behavioral;