<p class="header_name" id="filter_sessions_header">Filter Sessions</p>
<p id="date_filter">1. Date:&nbsp;&nbsp;
	<input type="text" name="datefilter" value="" />
</p>
<p id="type_filter">2. Type:&nbsp;&nbsp;
	<select name="typeDropbtn">
		<option value=""></option>
		<option value="Type1">Type1</option>
		<option value="Type2">Type2</option>
	</select>
</p>
<p id="room_filter">3. Room:&nbsp;&nbsp;
	<select name="roomDropbtn">
		<option value=""></option>
		<option value="Room1">Room1</option>
		<option value="Room2">Room2</option>
	</select>
</p>
<p id="advisor_filter">4. Advisor:&nbsp;&nbsp;
	<select name="advisorDropbtn">
		<option value=""></option>
		<option value="Advisor1">Advisor1</option>
		<option value="Advisor2">Advisor2</option>
	</select>
</p>
<div class="submitFilter">
	<input type="submit" name="btnSubmitFilter" value="Submit" id="btnSubmitFilter" />
</div>

<!-- Date Range Picker -->
<script type="text/javascript">
	$(function() {
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