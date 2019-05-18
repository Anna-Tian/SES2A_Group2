<%@page 
import="java.sql.*" 
import="java.text.*"
%>

<p class="header_name" id="filter_sessions_header" style="width:90%" >Filter Sessions</p>
<form class="filter_sessions" action="OneToOneSessions.jsp" method="POST">
	<p id="date_filter">1. Date:&nbsp;&nbsp;
		<input type="text" name="datefilter" value="" />
	</p>
	<p id="type_filter">2. Type:&nbsp;&nbsp;
		<select name="typeDropbtn">
			<option value=""></option>
			<option value="UG/PG course work students">UG/PG course work students</option>
			<option value="UP/PG Others">UP/PG Others</option>
		</select>
	</p>
	<p id="room_filter">3. Room:&nbsp;&nbsp;
		<select name="roomDropbtn">
			<option value=""></option>
			<%
			try{
				String Query="SELECT * FROM room";
				String host = "jdbc:mysql://localhost:3306/uts_help";
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				Connection conn=DriverManager.getConnection(host, "root", "rootroot");
				Statement stm = conn.createStatement();
				ResultSet rs = stm.executeQuery(Query);
				while(rs.next()){
					%>
					<option value="<%=rs.getInt("roomId")%>"><%=rs.getString("roomLocation") %></option>
					<%
				}
			} catch(Exception ex){
				ex.printStackTrace();
			}
			%>
		</select>
	</p>
	<p id="advisor_filter">4. Advisor:&nbsp;&nbsp;
		<select name="advisorDropbtn">
			<option value=""></option>
			<%
			try{
				String Query="SELECT * FROM admin";
				String host = "jdbc:mysql://localhost:3306/uts_help";
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				Connection conn=DriverManager.getConnection(host, "root", "rootroot");
				Statement stm = conn.createStatement();
				ResultSet rs = stm.executeQuery(Query);
				while(rs.next()){
					%>
					<option value="<%=rs.getInt("adminId")%>"><%=rs.getString("firstName") %> <%=rs.getString("lastName") %></option>
					<%
				}
			} catch(Exception ex){
				ex.printStackTrace();
			}
			%>
		</select>
	</p>
	<div class="submitFilter">
		<input type="submit" name="btnSubmitFilter" value="Submit" id="btnSubmitFilter" style="float:left"/>
		<input type="reset" value="Reset" style="float:left">
	</div>

</form>

<!-- Date Range Picker -->
<script type="text/javascript">
	$(function() {
		//DateRangePicker
		$('input[name="datefilter"]').daterangepicker({
			autoUpdateInput: false,
			locale: {
				cancelLabel: 'Clear'
			}
		});
		$('input[name="datefilter"]').on('apply.daterangepicker', function(ev, picker) {
			
			$(this).val(picker.startDate.format('DD/MM/YYYY') + ' - ' + picker.endDate.format('DD/MM/YYYY'));
		});
		$('input[name="datefilter"]').on('cancel.daterangepicker', function(ev, picker) {
			$(this).val('');
		});
	});
</script>

