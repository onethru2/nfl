<?php
require('includes/application_top.php');
require('includes/classes/team.php');

if (!$isAdmin) {
	header('Location: index.php');
}

if ($_POST['action'] == 'Update') {
	foreach($_POST['game'] as $game) {
		$homeScore = ((strlen($game['homeScore']) > 0) ? $game['homeScore'] : 'NULL');
		$visitorScore = ((strlen($game['visitorScore']) > 0) ? $game['visitorScore'] : 'NULL');
		$overtime = ((!empty($game['OT'])) ? '1' : '0');
		$sql = "update " . $db_prefix . "schedule ";
		$sql .= "set homeScore = " . $homeScore . ", visitorScore = " . $visitorScore . ", overtime = " . $overtime . " ";
		$sql .= "where gameID = " . $game['gameID'];
		mysql_query($sql) or die('Error updating score: ' . mysql_error());
	}
	header('Location: index.php');
}

$week = (int)$_GET['week'];
if (empty($week)) {
	//get current week
	$week = (int)getCurrentWeek();
}

include('includes/header.php');
?>
	<h1>Enter Scores - Week <?php echo $week; ?></h1>
<?php
//display week nav
$sql = "select distinct weekNum from " . $db_prefix . "schedule order by weekNum;";
$query = mysql_query($sql);
$weekNav = '<div class="navbar3"><b>Go to week:</b> ';
$i = 0;
while ($result = mysql_fetch_array($query)) {
	if ($i > 0) $weekNav .= ' | ';
	if ($week !== (int)$result['weekNum']) {
		$weekNav .= '<a href="scores.php?week=' . $result['weekNum'] . '">' . $result['weekNum'] . '</a>';
	} else {
		$weekNav .= $result['weekNum'];
	}
	$i++;
}
$weekNav .= '</div>' . "\n";
echo $weekNav;
?>
<script type="text/javascript">
function getScores(weekNum) {
	$.get("getHtmlScores.php", {week: weekNum}, function(data) {
		for(var item in data) {
			visitorScoreField = document.getElementById('game[' + data[item].gameID + '][visitorScore]');
			homeScoreField = document.getElementById('game[' + data[item].gameID + '][homeScore]');
			OTField = document.getElementById('game[' + data[item].gameID + '][OT]');
			if (visitorScoreField.value !== data[item].visitorScore) {
				visitorScoreField.value = data[item].visitorScore;
				visitorScoreField.className="fieldLoaded";
			}
			if (homeScoreField.value !== data[item].homeScore) {
				homeScoreField.value = data[item].homeScore;
				homeScoreField.className="fieldLoaded";
			}
			if (data[item].overtime == '1') {
				OTField.checked = true;
			}
		}
	},'json');
}
</script>
<p><input type="button" value="Load Scores" onclick="return getScores(<?php echo $week; ?>);" /></p>
<form id="scoresForm" name="scoresForm" action="scores.php" method="post">
<input type="hidden" name="week" value="<?php echo $week; ?>" />
<?php
$sql = "select s.*, ht.city, ht.team, ht.displayName, vt.city, vt.team, vt.displayName ";
$sql .= "from " . $db_prefix . "schedule s ";
$sql .= "inner join " . $db_prefix . "teams ht on s.homeID = ht.teamID ";
$sql .= "inner join " . $db_prefix . "teams vt on s.visitorID = vt.teamID ";
$sql .= "where weekNum = " . $week . " ";
$sql .= "order by gameTimeEastern";
$query = mysql_query($sql);
if (mysql_num_rows($query) > 0) {
	echo '<table cellpadding="4" cellspacing="0" class="table1">' . "\n";
	echo '	<tr><th colspan="6" align="left">Week ' . $week . '</th></tr>' . "\n";
	$i = 0;
	while ($result = mysql_fetch_array($query)) {
		$homeTeam = new team($result['homeID']);
		$visitorTeam = new team($result['visitorID']);
		$rowclass = (($i % 2 == 0) ? ' class="altrow"' : '');
		echo '		<tr' . $rowclass . '>' . "\n";
		echo '			<td><input type="hidden" name="game[' . $result['gameID'] . '][gameID]" value="' . $result['gameID'] . '" />' . date('D n/j g:i a', strtotime($result['gameTimeEastern'])) . ' ET</td>' . "\n";
		echo '			<td align="right"><input type="hidden" name="gameID[' . strtolower($visitorTeam->team) . ']" value="' . $result['gameID'] . '" />' . $visitorTeam->teamName . '</td>' . "\n";
		echo '			<td><input type="text" name="game[' . $result['gameID'] . '][visitorScore]" id="game[' . $result['gameID'] . '][visitorScore]" value="' . $result['visitorScore'] . '" size="3" /></td>' . "\n";
		echo '			<td align="right"><input type="hidden" name="gameID[' . strtolower($homeTeam->team) . ']" value="' . $result['gameID'] . '" />at ' . $homeTeam->teamName . '</td>' . "\n";
		echo '			<td><input type="text" name="game[' . $result['gameID'] . '][homeScore]" id="game[' . $result['gameID'] . '][homeScore]" value="' . $result['homeScore'] . '" size="3" /></td>' . "\n";
		echo '			<td>OT <input type="checkbox" name="game[' . $result['gameID'] . '][OT]" id="game[' . $result['gameID'] . '][OT]" value="1"' . (($result['overtime']) ? ' checked="checked"' : '') . '" /></td>' . "\n";
		echo '		</tr>' . "\n";
		$i++;
	}
	echo '</table>' . "\n";
}
?>
<input type="submit" name="action" value="Update" />
</form>
<?php
include('includes/footer.php');
?>
