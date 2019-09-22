<map version="freeplane 1.5.9">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="PISH.py: a Parallel Interactive&#xa;Shell in Python" FOLDED="false" ID="ID_1919923617" CREATED="1491273275331" MODIFIED="1491584158334" LINK="../../../../../Data/mind/TimingComparisonScript.mm">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
<edge STYLE="bezier" WIDTH="thin"/>
<hook NAME="MapStyle" background="#dcdcdc">
    <properties fit_to_viewport="false;" show_icon_for_attributes="true" show_note_icons="true" show_notes_in_map="false"/>

<map_styles>
<stylenode LOCALIZED_TEXT="styles.root_node" STYLE="oval" UNIFORM_SHAPE="true" VGAP_QUANTITY="24.0 pt">
<font SIZE="24"/>
<stylenode LOCALIZED_TEXT="styles.predefined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="default" MAX_WIDTH="600.0 px" COLOR="#000000" STYLE="as_parent">
<font NAME="SansSerif" SIZE="12" BOLD="false" ITALIC="false"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.details" COLOR="#999999">
<font NAME="Microsoft YaHei" SIZE="10"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.attributes">
<font SIZE="9"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.note"/>
<stylenode LOCALIZED_TEXT="defaultstyle.floating">
<edge STYLE="hide_edge"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.user-defined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="styles.topic" COLOR="#0000a0" STYLE="fork">
<font NAME="Microsoft YaHei UI" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subtopic" COLOR="#007878" STYLE="fork">
<font NAME="Microsoft YaHei UI" BOLD="true"/>
</stylenode>
<stylenode TEXT="Comment" COLOR="#000078">
<icon BUILTIN="info"/>
</stylenode>
<stylenode TEXT="TODO" COLOR="#c80000">
<icon BUILTIN="unchecked"/>
</stylenode>
<stylenode TEXT="DONE" COLOR="#006400">
<icon BUILTIN="checked"/>
</stylenode>
<stylenode TEXT="WAIT" COLOR="#0000c8">
<icon BUILTIN="hourglass"/>
</stylenode>
<stylenode TEXT="DROP" COLOR="#646464">
<icon BUILTIN="broken-line"/>
</stylenode>
<stylenode TEXT="Green Cloud">
<cloud COLOR="#ccffcc" SHAPE="ROUND_RECT"/>
</stylenode>
<stylenode TEXT="Yellow Cloud">
<cloud COLOR="#ffffcc" SHAPE="ARC"/>
</stylenode>
<stylenode TEXT="Blue Cloud">
<cloud COLOR="#ccffff" SHAPE="ARC"/>
</stylenode>
<stylenode TEXT="Red Cloud">
<cloud COLOR="#ffccff" SHAPE="ARC"/>
</stylenode>
<stylenode TEXT="Code" COLOR="#000000" BACKGROUND_COLOR="#e6e6e6">
<font NAME="Monospaced" SIZE="10"/>
</stylenode>
<stylenode TEXT="Title" COLOR="#000000" STYLE="fork" NUMBERED="true">
<font NAME="Microsoft YaHei UI" BOLD="true"/>
</stylenode>
<stylenode TEXT="Subtitle" COLOR="#010101" STYLE="fork" NUMBERED="true">
<font NAME="Microsoft YaHei UI" BOLD="true" ITALIC="false"/>
</stylenode>
<stylenode TEXT="Subsubtitle" COLOR="#000000" STYLE="fork" NUMBERED="true">
<font NAME="Microsoft YaHei UI" BOLD="true" ITALIC="false"/>
</stylenode>
<stylenode TEXT="Subsubsubtitle" COLOR="#000000" STYLE="fork" NUMBERED="true">
<font NAME="Microsoft YaHei UI" BOLD="true" ITALIC="false"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.AutomaticLayout" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="AutomaticLayout.level.root">
<font SIZE="18"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,1">
<font SIZE="16"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,2">
<font SIZE="14"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,3">
<font SIZE="12"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,4">
<font SIZE="12"/>
</stylenode>
</stylenode>
</stylenode>
</map_styles>
</hook>
<hook NAME="accessories/plugins/AutomaticLayout.properties" VALUE="ALL"/>
<node TEXT="feature" LOCALIZED_STYLE_REF="styles.subtopic" POSITION="right" ID="ID_1864492547" CREATED="1491273313865" MODIFIED="1491273326642">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
<node TEXT="PISH can start any number of shells in separate parallel threads" ID="ID_531771714" CREATED="1491273327446" MODIFIED="1491344155809">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
</node>
<node TEXT="in any remote shell, command line or GUI programs can be started serially" ID="ID_109150438" CREATED="1491344070820" MODIFIED="1491344176147">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
</node>
<node TEXT="PISH can send shell/tcl commands to any target shell" ID="ID_710377873" CREATED="1491273361539" MODIFIED="1491344198202">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
</node>
<node TEXT="listen for response, analyze to decide what future commands to send" ID="ID_690463588" CREATED="1491273382752" MODIFIED="1491273514039">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
</node>
<node TEXT="(optional) use GUI with different tabs to display output from parallel shells" ID="ID_483963274" CREATED="1491343976509" MODIFIED="1491344014465">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
</node>
</node>
<node TEXT="PISH" LOCALIZED_STYLE_REF="styles.subtopic" POSITION="right" ID="ID_630228719" CREATED="1491273599258" MODIFIED="1493003810544">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
<richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      top level
    </p>
  </body>
</html>
</richcontent>
<node TEXT="static variables" ID="ID_548705498" CREATED="1491283586098" MODIFIED="1491283597919">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
<font BOLD="true"/>
<node TEXT="update_cycle_ms: int" STYLE_REF="Code" ID="ID_1520260654" CREATED="1491284378756" MODIFIED="1493006731133">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
</node>
</node>
<node TEXT="private methods" ID="ID_410790210" CREATED="1493006967880" MODIFIED="1493006976484">
<attribute_layout VALUE_WIDTH="149.99999552965178 pt"/>
<font BOLD="true"/>
<node TEXT="update_gui()" STYLE_REF="Code" ID="ID_1737349519" CREATED="1493006962760" MODIFIED="1493007078520">
<attribute_layout VALUE_WIDTH="149.99999552965178 pt"/>
<node TEXT="will be called every cycle, to update output widgets" ID="ID_701528978" CREATED="1493006997958" MODIFIED="1493007023286">
<attribute_layout VALUE_WIDTH="149.99999552965178 pt"/>
</node>
</node>
</node>
<node TEXT="public methods" ID="ID_631542052" CREATED="1493006847213" MODIFIED="1493006854519">
<attribute_layout VALUE_WIDTH="149.99999552965178 pt"/>
<font BOLD="true"/>
<node TEXT="init_gui()" STYLE_REF="Code" ID="ID_78425055" CREATED="1493006855456" MODIFIED="1493006862061">
<attribute_layout VALUE_WIDTH="149.99999552965178 pt"/>
</node>
<node TEXT="add_shell(ish: IntShell)" STYLE_REF="Code" ID="ID_1383142840" CREATED="1493006914224" MODIFIED="1493006934104">
<attribute_layout VALUE_WIDTH="149.99999552965178 pt"/>
</node>
<node TEXT="start_gui()" STYLE_REF="Code" ID="ID_581668041" CREATED="1493006867100" MODIFIED="1493007072107">
<attribute_layout VALUE_WIDTH="149.99999552965178 pt"/>
</node>
</node>
</node>
<node TEXT="class IntShell" LOCALIZED_STYLE_REF="styles.subtopic" POSITION="right" ID="ID_1948527662" CREATED="1491274093400" MODIFIED="1492997093041">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
<richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      base class for
    </p>
    <p>
      an interactive
    </p>
    <p>
      shell
    </p>
  </body>
</html>
</richcontent>
<node TEXT="feature" ID="ID_615547040" CREATED="1491282646109" MODIFIED="1491282698806">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
<font BOLD="true"/>
<node TEXT="work flow" ID="ID_1271798299" CREATED="1491283677050" MODIFIED="1491283698817">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
<font ITALIC="true"/>
<node TEXT="1. initialize" ID="ID_871024962" CREATED="1491282702548" MODIFIED="1491282707640">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
</node>
<node TEXT="2. analyze output, and generate high level information" ID="ID_1600890874" CREATED="1491282708719" MODIFIED="1493007193020">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
</node>
<node TEXT="3. when encounter EOF, do something to wrap-up" ID="ID_1366286371" CREATED="1491282721227" MODIFIED="1491282743007">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
</node>
</node>
<node TEXT="flag line" ID="ID_1727560508" CREATED="1491283699308" MODIFIED="1491283715105">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
<font ITALIC="true"/>
<node TEXT="to distinguish delibrate inserted message from other output information" ID="ID_1226096030" CREATED="1491283757250" MODIFIED="1491283805400">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
</node>
<node TEXT="format" ID="ID_1294335919" CREATED="1491283817651" MODIFIED="1491283819186">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
<node TEXT="&quot;&lt;&lt;PISH::&quot; + flag + &quot;&gt;&gt;&quot;" STYLE_REF="Code" ID="ID_759138915" CREATED="1491283716003" MODIFIED="1491283746847">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
</node>
</node>
<node TEXT="flag options" ID="ID_1080535500" CREATED="1491283821458" MODIFIED="1491283828030">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
<node TEXT="CMD_START" STYLE_REF="Code" ID="ID_533789962" CREATED="1491283828593" MODIFIED="1493006462665">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
</node>
<node TEXT="CMD_END" STYLE_REF="Code" ID="ID_1077294880" CREATED="1491283834129" MODIFIED="1491344515904">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
</node>
</node>
</node>
</node>
<node TEXT="public variables" ID="ID_1075667947" CREATED="1491282483931" MODIFIED="1493010922260">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
<font BOLD="true"/>
<node TEXT="name: str" STYLE_REF="Code" ID="ID_781991986" CREATED="1491283515193" MODIFIED="1491283529749">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
</node>
<node TEXT="log_fpath: str" STYLE_REF="Code" ID="ID_1896199012" CREATED="1491344385435" MODIFIED="1491344392665">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
</node>
<node TEXT="init_cmd: str" STYLE_REF="Code" ID="ID_1033181348" CREATED="1491344589284" MODIFIED="1491344598487">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
</node>
<node TEXT="timeout_cycle: int" STYLE_REF="Code" ID="ID_426994312" CREATED="1491284378756" MODIFIED="1493011285629">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
</node>
<node TEXT="status: enum" STYLE_REF="Code" ID="ID_720582229" CREATED="1491285018140" MODIFIED="1491285048599">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
<node TEXT="BUSY" STYLE_REF="Code" ID="ID_637969640" CREATED="1491344630171" MODIFIED="1491344637565">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
<node TEXT="initialized, or after CMD_START but before CMD_END" ID="ID_1919645309" CREATED="1493007314226" MODIFIED="1493011225711">
<attribute_layout VALUE_WIDTH="149.99999552965178 pt"/>
</node>
</node>
<node TEXT="IDLE_NORMAL" STYLE_REF="Code" ID="ID_514945524" CREATED="1491344631859" MODIFIED="1493010526883">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
<node TEXT="after CMD_END" ID="ID_100544643" CREATED="1493007374644" MODIFIED="1493007571628">
<attribute_layout VALUE_WIDTH="149.99999552965178 pt"/>
</node>
</node>
<node TEXT="IDLE_TIMEOUT" STYLE_REF="Code" ID="ID_1087929103" CREATED="1493007284806" MODIFIED="1493010529711">
<attribute_layout VALUE_WIDTH="149.99999552965178 pt"/>
<node TEXT="no CMD_END, but cnt_idle_output &gt; timeout_threshold" ID="ID_118204259" CREATED="1493007380292" MODIFIED="1493007571613">
<attribute_layout VALUE_WIDTH="149.99999552965178 pt"/>
</node>
</node>
<node TEXT="EOF" STYLE_REF="Code" ID="ID_1948488510" CREATED="1491344633155" MODIFIED="1493007359420">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
<node TEXT="after EOF" ID="ID_1553612018" CREATED="1493007577874" MODIFIED="1493007580196">
<attribute_layout VALUE_WIDTH="149.99999552965178 pt"/>
</node>
</node>
</node>
<node TEXT="q_stdout: Queue" STYLE_REF="Code" ID="ID_136557000" CREATED="1493011358910" MODIFIED="1493011552939">
<attribute_layout VALUE_WIDTH="149.99999552965178 pt"/>
</node>
<node TEXT="q_stderr: Queue" STYLE_REF="Code" ID="ID_1780892737" CREATED="1493011362241" MODIFIED="1493011555167">
<attribute_layout VALUE_WIDTH="149.99999552965178 pt"/>
</node>
</node>
<node TEXT="private variables" ID="ID_561425596" CREATED="1493010922556" MODIFIED="1493010930139">
<attribute_layout VALUE_WIDTH="149.99999552965178 pt"/>
<font BOLD="true"/>
<node TEXT="_q_stdin: Queue" STYLE_REF="Code" ID="ID_1542933592" CREATED="1491285162915" MODIFIED="1493011351763">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
</node>
<node TEXT="_q_stdout: Queue" STYLE_REF="Code" ID="ID_879475136" CREATED="1491344794043" MODIFIED="1493011354091">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
</node>
<node TEXT="_q_stderr: Queue" STYLE_REF="Code" ID="ID_1409616071" CREATED="1493004551760" MODIFIED="1493011355869">
<attribute_layout VALUE_WIDTH="149.99999552965178 pt"/>
</node>
<node TEXT="_cnt_idle_stdout: int" STYLE_REF="Code" ID="ID_862514475" CREATED="1493004596334" MODIFIED="1493011487111">
<attribute_layout VALUE_WIDTH="149.99999552965178 pt"/>
</node>
<node TEXT="_cnt_idle_stderr: int" STYLE_REF="Code" ID="ID_989032581" CREATED="1493004627502" MODIFIED="1493011489601">
<attribute_layout VALUE_WIDTH="149.99999552965178 pt"/>
</node>
</node>
<node TEXT="public methods" ID="ID_1726461399" CREATED="1493005016256" MODIFIED="1493006983520">
<attribute_layout VALUE_WIDTH="149.99999552965178 pt"/>
<font BOLD="true"/>
<node TEXT="update()" STYLE_REF="Code" ID="ID_1375548555" CREATED="1493007522495" MODIFIED="1493007529080">
<attribute_layout VALUE_WIDTH="149.99999552965178 pt"/>
<node TEXT="will be called every cycle" ID="ID_1237505251" CREATED="1493007530267" MODIFIED="1493007535026">
<attribute_layout VALUE_WIDTH="149.99999552965178 pt"/>
<node TEXT="1. update cnt_idle_*" ID="ID_100257857" CREATED="1493007556794" MODIFIED="1493007664614">
<attribute_layout VALUE_WIDTH="149.99999552965178 pt"/>
</node>
<node TEXT="2. call proc_output()" ID="ID_1870001814" CREATED="1493010576178" MODIFIED="1493010825163">
<attribute_layout VALUE_WIDTH="149.99999552965178 pt"/>
</node>
<node TEXT="3. call _send_stdin()" ID="ID_1620108303" CREATED="1493007664879" MODIFIED="1493010833699">
<attribute_layout VALUE_WIDTH="149.99999552965178 pt"/>
</node>
</node>
</node>
<node TEXT="send_cmd(cmd: str)" STYLE_REF="Code" ID="ID_662200315" CREATED="1493010740929" MODIFIED="1493010762716">
<attribute_layout VALUE_WIDTH="149.99999552965178 pt"/>
</node>
</node>
<node TEXT="private methods" ID="ID_162408975" CREATED="1491283601473" MODIFIED="1493006982483">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
<font BOLD="true"/>
<node TEXT="active (thread control)" ID="ID_901567440" CREATED="1491284714537" MODIFIED="1491284732616">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
<font ITALIC="true"/>
<node TEXT="_monitor_stream(stream)" STYLE_REF="Code" ID="ID_727682550" CREATED="1493004912203" MODIFIED="1493005012136">
<attribute_layout VALUE_WIDTH="149.99999552965178 pt"/>
</node>
<node TEXT="_send_stdin()" STYLE_REF="Code" ID="ID_1630351562" CREATED="1491284793464" MODIFIED="1493005046298">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
<node TEXT="check if the status is &quot;IDLE_*&quot;, then send one cmd from cmd fifo" ID="ID_1094610874" CREATED="1491285124810" MODIFIED="1493010814240">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
</node>
</node>
</node>
<node TEXT="passive (analyze/respond)" ID="ID_503236723" CREATED="1491284735187" MODIFIED="1491284755167">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
<font ITALIC="true"/>
<node TEXT="_get_flag(line: str) -&gt; Union(None, str)" STYLE_REF="Code" ID="ID_403863853" CREATED="1491283626749" MODIFIED="1493006618991">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
</node>
<node TEXT="_make_flag_str(flag: str)" STYLE_REF="Code" ID="ID_1769342405" CREATED="1493006361791" MODIFIED="1493006621366">
<attribute_layout VALUE_WIDTH="149.99999552965178 pt"/>
</node>
<node TEXT="_start_prog(prog_name: str) -&gt; str" STYLE_REF="DROP" ID="ID_464772488" CREATED="1491283937376" MODIFIED="1491344462480">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
</node>
</node>
</node>
<node TEXT="virtual methods" ID="ID_1720150769" CREATED="1491282480453" MODIFIED="1493006984415">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
<font BOLD="true"/>
<node TEXT="before_start() -&gt; None" STYLE_REF="Code" ID="ID_824117826" CREATED="1491274102162" MODIFIED="1493013361053">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
<node TEXT="will be called before starting the program" ID="ID_595670500" CREATED="1491274117472" MODIFIED="1491344577048">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
</node>
</node>
<node TEXT="proc_output() -&gt; None" STYLE_REF="Code" ID="ID_192800884" CREATED="1491282431826" MODIFIED="1493011412073">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
<node TEXT="will be called every cycle, to process stdout/stderr looking for flag line or EOF" ID="ID_359703697" CREATED="1491284201780" MODIFIED="1493011510537">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
</node>
</node>
<node TEXT="after_eof() -&gt; None" STYLE_REF="Code" ID="ID_943063532" CREATED="1491274164342" MODIFIED="1491344569759">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
<node TEXT="will be called when get EOF" ID="ID_67739210" CREATED="1491274170406" MODIFIED="1491274374102">
<attribute_layout VALUE_WIDTH="150.0 pt"/>
</node>
</node>
</node>
</node>
</node>
</map>
