/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50137
Source Host           : localhost:3306
Source Database       : nflpickem

Target Server Type    : MYSQL
Target Server Version : 50137
File Encoding         : 65001

Date: 2011-08-08 12:47:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `nflp_comments`
-- ----------------------------
DROP TABLE IF EXISTS `nflp_comments`;
CREATE TABLE `nflp_comments` (
  `commentID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `comment` longtext NOT NULL,
  `postDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`commentID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nflp_comments
-- ----------------------------

-- ----------------------------
-- Table structure for `nflp_divisions`
-- ----------------------------
DROP TABLE IF EXISTS `nflp_divisions`;
CREATE TABLE `nflp_divisions` (
  `divisionID` int(11) NOT NULL AUTO_INCREMENT,
  `conference` varchar(10) NOT NULL,
  `division` varchar(32) NOT NULL,
  PRIMARY KEY (`divisionID`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nflp_divisions
-- ----------------------------
INSERT INTO `nflp_divisions` VALUES ('1', 'AFC', 'North');
INSERT INTO `nflp_divisions` VALUES ('2', 'AFC', 'South');
INSERT INTO `nflp_divisions` VALUES ('3', 'AFC', 'East');
INSERT INTO `nflp_divisions` VALUES ('4', 'AFC', 'West');
INSERT INTO `nflp_divisions` VALUES ('5', 'NFC', 'North');
INSERT INTO `nflp_divisions` VALUES ('6', 'NFC', 'South');
INSERT INTO `nflp_divisions` VALUES ('7', 'NFC', 'East');
INSERT INTO `nflp_divisions` VALUES ('8', 'NFC', 'West');

-- ----------------------------
-- Table structure for `nflp_email_templates`
-- ----------------------------
DROP TABLE IF EXISTS `nflp_email_templates`;
CREATE TABLE `nflp_email_templates` (
  `email_template_key` varchar(255) NOT NULL,
  `email_template_title` varchar(255) NOT NULL,
  `default_subject` varchar(255) DEFAULT NULL,
  `default_message` text,
  `subject` varchar(255) DEFAULT NULL,
  `message` text,
  PRIMARY KEY (`email_template_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nflp_email_templates
-- ----------------------------
INSERT INTO `nflp_email_templates` VALUES ('WEEKLY_PICKS_REMINDER', 'Weekly Picks Reminder', 'NFL Pick \'Em Week {week} Reminder', 'Hello {player},<br /><br />You are receiving this email because you do not yet have all of your picks in for week {week}.&nbsp; This is your reminder.&nbsp; The first game is {first_game} (Eastern), so to receive credit for that game, you\'ll have to make your pick before then.<br /><br />Links:<br />&nbsp;- NFL Pick \'Em URL: {site_url}<br />&nbsp;- Help/Rules: {rules_url}<br /><br />Good Luck!<br />', 'NFL Pick \'Em Week {week} Reminder', 'Hello {player},<br /><br />You are receiving this email because you do not yet have all of your picks in for week {week}.&nbsp; This is your reminder.&nbsp; The first game is {first_game} (Eastern), so to receive credit for that game, you\'ll have to make your pick before then.<br /><br />Links:<br />&nbsp;- NFL Pick \'Em URL: {site_url}<br />&nbsp;- Help/Rules: {rules_url}<br /><br />Good Luck!<br />');
INSERT INTO `nflp_email_templates` VALUES ('WEEKLY_RESULTS_REMINDER', 'Last Week Results/Reminder', 'NFL Pick \'Em Week {previousWeek} Standings/Reminder', 'Congratulations this week go to {winners} for winning week {previousWeek}.  The winner(s) had {winningScore} out of {possibleScore} picks correct.<br /><br />The current leaders are:<br />{currentLeaders}<br /><br />The most accurate players are:<br />{bestPickRatios}<br /><br />*Reminder* - Please make your picks for week {week} before {first_game} (Eastern).<br /><br />Links:<br />&nbsp;- NFL Pick \'Em URL: {site_url}<br />&nbsp;- Help/Rules: {rules_url}<br /><br />Good Luck!<br />', 'NFL Pick \'Em Week {previousWeek} Standings/Reminder', 'Congratulations this week go to {winners} for winning week {previousWeek}.  The winner(s) had {winningScore} out of {possibleScore} picks correct.<br /><br />The current leaders are:<br />{currentLeaders}<br /><br />The most accurate players are:<br />{bestPickRatios}<br /><br />*Reminder* - Please make your picks for week {week} before {first_game} (Eastern).<br /><br />Links:<br />&nbsp;- NFL Pick \'Em URL: {site_url}<br />&nbsp;- Help/Rules: {rules_url}<br /><br />Good Luck!<br />');
INSERT INTO `nflp_email_templates` VALUES ('FINAL_RESULTS', 'Final Results', 'NFL Pick \'Em 2011 Final Results', 'Congratulations this week go to {winners} for winning week\r\n{previousWeek}. The winner(s) had {winningScore} out of {possibleScore}\r\npicks correct.<br /><br /><span style=\"font-weight: bold;\">Congratulations to {final_winner}</span> for winning NFL Pick \'Em 2011!&nbsp; {final_winner} had {final_winningScore} wins and had a pick ratio of {picks}/{possible} ({pickpercent}%).<br /><br />Top Wins:<br />{currentLeaders}<br /><br />The most accurate players are:<br />{bestPickRatios}<br /><br />Thanks for playing, and I hope to see you all again for NFL Pick \'Em 2012!', 'NFL Pick \'Em 2011 Final Results', 'Congratulations this week go to {winners} for winning week\r\n{previousWeek}. The winner(s) had {winningScore} out of {possibleScore}\r\npicks correct.<br /><br /><span style=\"font-weight: bold;\">Congratulations to {final_winner}</span> for winning NFL Pick \'Em 2011!&nbsp; {final_winner} had {final_winningScore} wins and had a pick ratio of {picks}/{possible} ({pickpercent}%).<br /><br />Top Wins:<br />{currentLeaders}<br /><br />The most accurate players are:<br />{bestPickRatios}<br /><br />Thanks for playing, and I hope to see you all again for NFL Pick \'Em 2012!');

-- ----------------------------
-- Table structure for `nflp_picks`
-- ----------------------------
DROP TABLE IF EXISTS `nflp_picks`;
CREATE TABLE `nflp_picks` (
  `userID` int(11) NOT NULL,
  `gameID` int(11) NOT NULL,
  `pickID` varchar(10) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`userID`,`gameID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nflp_picks
-- ----------------------------

-- ----------------------------
-- Table structure for `nflp_picksummary`
-- ----------------------------
DROP TABLE IF EXISTS `nflp_picksummary`;
CREATE TABLE `nflp_picksummary` (
  `weekNum` int(11) NOT NULL DEFAULT '0',
  `userID` int(11) NOT NULL DEFAULT '0',
  `tieBreakerPoints` int(11) NOT NULL,
  `showPicks` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`weekNum`,`userID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nflp_picksummary
-- ----------------------------

-- ----------------------------
-- Table structure for `nflp_schedule`
-- ----------------------------
DROP TABLE IF EXISTS `nflp_schedule`;
CREATE TABLE `nflp_schedule` (
  `gameID` int(11) NOT NULL auto_increment,
  `weekNum` int(11) NOT NULL,
  `gameTimeEastern` datetime default NULL,
  `homeID` varchar(10) NOT NULL,
  `homeScore` int(11) default NULL,
  `visitorID` varchar(10) NOT NULL,
  `visitorScore` int(11) default NULL,
  `overtime` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`gameID`),
  KEY `GameID` (`gameID`),
  KEY `HomeID` (`homeID`),
  KEY `VisitorID` (`visitorID`)
) ENGINE=MyISAM AUTO_INCREMENT=513 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nflp_schedule
-- ----------------------------
INSERT INTO `nflp_schedule` VALUES ('257', '1', '2012-09-05 20:30:00', 'NYG', null, 'DAL', null, '0');
INSERT INTO `nflp_schedule` VALUES ('258', '1', '2012-09-09 13:00:00', 'CHI', null, 'IND', null, '0');
INSERT INTO `nflp_schedule` VALUES ('259', '1', '2012-09-09 13:00:00', 'CLE', null, 'PHI', null, '0');
INSERT INTO `nflp_schedule` VALUES ('260', '1', '2012-09-09 13:00:00', 'DET', null, 'STL', null, '0');
INSERT INTO `nflp_schedule` VALUES ('261', '1', '2012-09-09 13:00:00', 'TEN', null, 'NE', null, '0');
INSERT INTO `nflp_schedule` VALUES ('262', '1', '2012-09-09 13:00:00', 'KC', null, 'ATL', null, '0');
INSERT INTO `nflp_schedule` VALUES ('263', '1', '2012-09-09 13:00:00', 'MIN', null, 'JAX', null, '0');
INSERT INTO `nflp_schedule` VALUES ('264', '1', '2012-09-09 13:00:00', 'NO', null, 'WAS', null, '0');
INSERT INTO `nflp_schedule` VALUES ('265', '1', '2012-09-09 13:00:00', 'NYJ', null, 'BUF', null, '0');
INSERT INTO `nflp_schedule` VALUES ('266', '1', '2012-09-09 13:00:00', 'HOU', null, 'MIA', null, '0');
INSERT INTO `nflp_schedule` VALUES ('267', '1', '2012-09-09 16:25:00', 'GB', null, 'SF', null, '0');
INSERT INTO `nflp_schedule` VALUES ('268', '1', '2012-09-09 16:25:00', 'ARI', null, 'SEA', null, '0');
INSERT INTO `nflp_schedule` VALUES ('269', '1', '2012-09-09 16:25:00', 'TB', null, 'CAR', null, '0');
INSERT INTO `nflp_schedule` VALUES ('270', '1', '2012-09-09 20:20:00', 'DEN', null, 'PIT', null, '0');
INSERT INTO `nflp_schedule` VALUES ('271', '1', '2012-09-10 19:00:00', 'BAL', null, 'CIN', null, '0');
INSERT INTO `nflp_schedule` VALUES ('272', '1', '2012-09-10 22:15:00', 'OAK', null, 'SD', null, '0');
INSERT INTO `nflp_schedule` VALUES ('273', '2', '2012-09-13 20:20:00', 'GB', null, 'CHI', null, '0');
INSERT INTO `nflp_schedule` VALUES ('274', '2', '2012-09-16 13:00:00', 'BUF', null, 'KC', null, '0');
INSERT INTO `nflp_schedule` VALUES ('275', '2', '2012-09-16 13:00:00', 'CIN', null, 'CLE', null, '0');
INSERT INTO `nflp_schedule` VALUES ('276', '2', '2012-09-16 13:00:00', 'IND', null, 'MIN', null, '0');
INSERT INTO `nflp_schedule` VALUES ('277', '2', '2012-09-16 13:00:00', 'MIA', null, 'OAK', null, '0');
INSERT INTO `nflp_schedule` VALUES ('278', '2', '2012-09-16 13:00:00', 'NE', null, 'ARI', null, '0');
INSERT INTO `nflp_schedule` VALUES ('279', '2', '2012-09-16 13:00:00', 'NYG', null, 'TB', null, '0');
INSERT INTO `nflp_schedule` VALUES ('280', '2', '2012-09-16 13:00:00', 'PHI', null, 'BAL', null, '0');
INSERT INTO `nflp_schedule` VALUES ('281', '2', '2012-09-16 13:00:00', 'CAR', null, 'NO', null, '0');
INSERT INTO `nflp_schedule` VALUES ('282', '2', '2012-09-16 13:00:00', 'JAX', null, 'HOU', null, '0');
INSERT INTO `nflp_schedule` VALUES ('283', '2', '2012-09-16 16:05:00', 'STL', null, 'WAS', null, '0');
INSERT INTO `nflp_schedule` VALUES ('284', '2', '2012-09-16 16:05:00', 'SEA', null, 'DAL', null, '0');
INSERT INTO `nflp_schedule` VALUES ('285', '2', '2012-09-16 16:25:00', 'PIT', null, 'NYJ', null, '0');
INSERT INTO `nflp_schedule` VALUES ('286', '2', '2012-09-16 16:25:00', 'SD', null, 'TEN', null, '0');
INSERT INTO `nflp_schedule` VALUES ('287', '2', '2012-09-16 20:20:00', 'SF', null, 'DET', null, '0');
INSERT INTO `nflp_schedule` VALUES ('288', '2', '2012-09-17 20:30:00', 'ATL', null, 'DEN', null, '0');
INSERT INTO `nflp_schedule` VALUES ('289', '3', '2012-09-20 20:20:00', 'CAR', null, 'NYG', null, '0');
INSERT INTO `nflp_schedule` VALUES ('290', '3', '2012-09-23 13:00:00', 'CHI', null, 'STL', null, '0');
INSERT INTO `nflp_schedule` VALUES ('291', '3', '2012-09-23 13:00:00', 'CLE', null, 'BUF', null, '0');
INSERT INTO `nflp_schedule` VALUES ('292', '3', '2012-09-23 13:00:00', 'DAL', null, 'TB', null, '0');
INSERT INTO `nflp_schedule` VALUES ('293', '3', '2012-09-23 13:00:00', 'TEN', null, 'DET', null, '0');
INSERT INTO `nflp_schedule` VALUES ('294', '3', '2012-09-23 13:00:00', 'IND', null, 'JAX', null, '0');
INSERT INTO `nflp_schedule` VALUES ('295', '3', '2012-09-23 13:00:00', 'MIA', null, 'NYJ', null, '0');
INSERT INTO `nflp_schedule` VALUES ('296', '3', '2012-09-23 13:00:00', 'MIN', null, 'SF', null, '0');
INSERT INTO `nflp_schedule` VALUES ('297', '3', '2012-09-23 13:00:00', 'NO', null, 'KC', null, '0');
INSERT INTO `nflp_schedule` VALUES ('298', '3', '2012-09-23 13:00:00', 'WAS', null, 'CIN', null, '0');
INSERT INTO `nflp_schedule` VALUES ('299', '3', '2012-09-23 16:05:00', 'ARI', null, 'PHI', null, '0');
INSERT INTO `nflp_schedule` VALUES ('300', '3', '2012-09-23 16:05:00', 'SD', null, 'ATL', null, '0');
INSERT INTO `nflp_schedule` VALUES ('301', '3', '2012-09-23 16:25:00', 'DEN', null, 'HOU', null, '0');
INSERT INTO `nflp_schedule` VALUES ('302', '3', '2012-09-23 16:25:00', 'OAK', null, 'PIT', null, '0');
INSERT INTO `nflp_schedule` VALUES ('303', '3', '2012-09-23 20:20:00', 'BAL', null, 'NE', null, '0');
INSERT INTO `nflp_schedule` VALUES ('304', '3', '2012-09-24 20:30:00', 'SEA', null, 'GB', null, '0');
INSERT INTO `nflp_schedule` VALUES ('305', '4', '2012-09-27 20:20:00', 'BAL', null, 'CLE', null, '0');
INSERT INTO `nflp_schedule` VALUES ('306', '4', '2012-09-30 13:00:00', 'ATL', null, 'CAR', null, '0');
INSERT INTO `nflp_schedule` VALUES ('307', '4', '2012-09-30 13:00:00', 'BUF', null, 'NE', null, '0');
INSERT INTO `nflp_schedule` VALUES ('308', '4', '2012-09-30 13:00:00', 'DET', null, 'MIN', null, '0');
INSERT INTO `nflp_schedule` VALUES ('309', '4', '2012-09-30 13:00:00', 'KC', null, 'SD', null, '0');
INSERT INTO `nflp_schedule` VALUES ('310', '4', '2012-09-30 13:00:00', 'STL', null, 'SEA', null, '0');
INSERT INTO `nflp_schedule` VALUES ('311', '4', '2012-09-30 13:00:00', 'NYJ', null, 'SF', null, '0');
INSERT INTO `nflp_schedule` VALUES ('312', '4', '2012-09-30 13:00:00', 'HOU', null, 'TEN', null, '0');
INSERT INTO `nflp_schedule` VALUES ('313', '4', '2012-09-30 16:05:00', 'DEN', null, 'OAK', null, '0');
INSERT INTO `nflp_schedule` VALUES ('314', '4', '2012-09-30 16:05:00', 'ARI', null, 'MIA', null, '0');
INSERT INTO `nflp_schedule` VALUES ('315', '4', '2012-09-30 16:05:00', 'JAX', null, 'CIN', null, '0');
INSERT INTO `nflp_schedule` VALUES ('316', '4', '2012-09-30 16:25:00', 'GB', null, 'NO', null, '0');
INSERT INTO `nflp_schedule` VALUES ('317', '4', '2012-09-30 16:25:00', 'TB', null, 'WAS', null, '0');
INSERT INTO `nflp_schedule` VALUES ('318', '4', '2012-09-30 20:20:00', 'PHI', null, 'NYG', null, '0');
INSERT INTO `nflp_schedule` VALUES ('319', '4', '2012-10-01 20:30:00', 'DAL', null, 'CHI', null, '0');
INSERT INTO `nflp_schedule` VALUES ('320', '5', '2012-10-04 20:20:00', 'STL', null, 'ARI', null, '0');
INSERT INTO `nflp_schedule` VALUES ('321', '5', '2012-10-07 13:00:00', 'CIN', null, 'MIA', null, '0');
INSERT INTO `nflp_schedule` VALUES ('322', '5', '2012-10-07 13:00:00', 'IND', null, 'GB', null, '0');
INSERT INTO `nflp_schedule` VALUES ('323', '5', '2012-10-07 13:00:00', 'KC', null, 'BAL', null, '0');
INSERT INTO `nflp_schedule` VALUES ('324', '5', '2012-10-07 13:00:00', 'MIN', null, 'TEN', null, '0');
INSERT INTO `nflp_schedule` VALUES ('325', '5', '2012-10-07 13:00:00', 'NYG', null, 'CLE', null, '0');
INSERT INTO `nflp_schedule` VALUES ('326', '5', '2012-10-07 13:00:00', 'PIT', null, 'PHI', null, '0');
INSERT INTO `nflp_schedule` VALUES ('327', '5', '2012-10-07 13:00:00', 'WAS', null, 'ATL', null, '0');
INSERT INTO `nflp_schedule` VALUES ('328', '5', '2012-10-07 16:05:00', 'CAR', null, 'SEA', null, '0');
INSERT INTO `nflp_schedule` VALUES ('329', '5', '2012-10-07 16:05:00', 'JAX', null, 'CHI', null, '0');
INSERT INTO `nflp_schedule` VALUES ('330', '5', '2012-10-07 16:25:00', 'NE', null, 'DEN', null, '0');
INSERT INTO `nflp_schedule` VALUES ('331', '5', '2012-10-07 16:25:00', 'SF', null, 'BUF', null, '0');
INSERT INTO `nflp_schedule` VALUES ('332', '5', '2012-10-07 20:20:00', 'NO', null, 'SD', null, '0');
INSERT INTO `nflp_schedule` VALUES ('333', '5', '2012-10-08 20:30:00', 'NYJ', null, 'HOU', null, '0');
INSERT INTO `nflp_schedule` VALUES ('334', '6', '2012-10-11 20:20:00', 'TEN', null, 'PIT', null, '0');
INSERT INTO `nflp_schedule` VALUES ('335', '6', '2012-10-14 13:00:00', 'ATL', null, 'OAK', null, '0');
INSERT INTO `nflp_schedule` VALUES ('336', '6', '2012-10-14 13:00:00', 'CLE', null, 'CIN', null, '0');
INSERT INTO `nflp_schedule` VALUES ('337', '6', '2012-10-14 13:00:00', 'MIA', null, 'STL', null, '0');
INSERT INTO `nflp_schedule` VALUES ('338', '6', '2012-10-14 13:00:00', 'NYJ', null, 'IND', null, '0');
INSERT INTO `nflp_schedule` VALUES ('339', '6', '2012-10-14 13:00:00', 'PHI', null, 'DET', null, '0');
INSERT INTO `nflp_schedule` VALUES ('340', '6', '2012-10-14 13:00:00', 'TB', null, 'KC', null, '0');
INSERT INTO `nflp_schedule` VALUES ('341', '6', '2012-10-14 13:00:00', 'BAL', null, 'DAL', null, '0');
INSERT INTO `nflp_schedule` VALUES ('342', '6', '2012-10-14 16:05:00', 'ARI', null, 'BUF', null, '0');
INSERT INTO `nflp_schedule` VALUES ('343', '6', '2012-10-14 16:05:00', 'SEA', null, 'NE', null, '0');
INSERT INTO `nflp_schedule` VALUES ('344', '6', '2012-10-14 16:25:00', 'SF', null, 'NYG', null, '0');
INSERT INTO `nflp_schedule` VALUES ('345', '6', '2012-10-14 16:25:00', 'WAS', null, 'MIN', null, '0');
INSERT INTO `nflp_schedule` VALUES ('346', '6', '2012-10-14 20:20:00', 'HOU', null, 'GB', null, '0');
INSERT INTO `nflp_schedule` VALUES ('347', '6', '2012-10-15 20:30:00', 'SD', null, 'DEN', null, '0');
INSERT INTO `nflp_schedule` VALUES ('348', '7', '2012-10-18 20:20:00', 'SF', null, 'SEA', null, '0');
INSERT INTO `nflp_schedule` VALUES ('349', '7', '2012-10-21 13:00:00', 'BUF', null, 'TEN', null, '0');
INSERT INTO `nflp_schedule` VALUES ('350', '7', '2012-10-21 13:00:00', 'IND', null, 'CLE', null, '0');
INSERT INTO `nflp_schedule` VALUES ('351', '7', '2012-10-21 13:00:00', 'STL', null, 'GB', null, '0');
INSERT INTO `nflp_schedule` VALUES ('352', '7', '2012-10-21 13:00:00', 'MIN', null, 'ARI', null, '0');
INSERT INTO `nflp_schedule` VALUES ('353', '7', '2012-10-21 13:00:00', 'NYG', null, 'WAS', null, '0');
INSERT INTO `nflp_schedule` VALUES ('354', '7', '2012-10-21 13:00:00', 'TB', null, 'NO', null, '0');
INSERT INTO `nflp_schedule` VALUES ('355', '7', '2012-10-21 13:00:00', 'CAR', null, 'DAL', null, '0');
INSERT INTO `nflp_schedule` VALUES ('356', '7', '2012-10-21 13:00:00', 'HOU', null, 'BAL', null, '0');
INSERT INTO `nflp_schedule` VALUES ('357', '7', '2012-10-21 16:25:00', 'OAK', null, 'JAX', null, '0');
INSERT INTO `nflp_schedule` VALUES ('358', '7', '2012-10-21 16:25:00', 'NE', null, 'NYJ', null, '0');
INSERT INTO `nflp_schedule` VALUES ('359', '7', '2012-10-21 20:20:00', 'CIN', null, 'PIT', null, '0');
INSERT INTO `nflp_schedule` VALUES ('360', '7', '2012-10-22 20:30:00', 'CHI', null, 'DET', null, '0');
INSERT INTO `nflp_schedule` VALUES ('361', '8', '2012-10-25 20:20:00', 'MIN', null, 'TB', null, '0');
INSERT INTO `nflp_schedule` VALUES ('362', '8', '2012-10-28 13:00:00', 'CHI', null, 'CAR', null, '0');
INSERT INTO `nflp_schedule` VALUES ('363', '8', '2012-10-28 13:00:00', 'CLE', null, 'SD', null, '0');
INSERT INTO `nflp_schedule` VALUES ('364', '8', '2012-10-28 13:00:00', 'DET', null, 'SEA', null, '0');
INSERT INTO `nflp_schedule` VALUES ('365', '8', '2012-10-28 13:00:00', 'GB', null, 'JAX', null, '0');
INSERT INTO `nflp_schedule` VALUES ('366', '8', '2012-10-28 13:00:00', 'TEN', null, 'IND', null, '0');
INSERT INTO `nflp_schedule` VALUES ('367', '8', '2012-10-28 13:00:00', 'STL', null, 'NE', null, '0');
INSERT INTO `nflp_schedule` VALUES ('368', '8', '2012-10-28 13:00:00', 'NYJ', null, 'MIA', null, '0');
INSERT INTO `nflp_schedule` VALUES ('369', '8', '2012-10-28 13:00:00', 'PHI', null, 'ATL', null, '0');
INSERT INTO `nflp_schedule` VALUES ('370', '8', '2012-10-28 13:00:00', 'PIT', null, 'WAS', null, '0');
INSERT INTO `nflp_schedule` VALUES ('371', '8', '2012-10-28 16:05:00', 'KC', null, 'OAK', null, '0');
INSERT INTO `nflp_schedule` VALUES ('372', '8', '2012-10-28 16:25:00', 'DAL', null, 'NYG', null, '0');
INSERT INTO `nflp_schedule` VALUES ('373', '8', '2012-10-28 20:20:00', 'DEN', null, 'NO', null, '0');
INSERT INTO `nflp_schedule` VALUES ('374', '8', '2012-10-29 20:30:00', 'ARI', null, 'SF', null, '0');
INSERT INTO `nflp_schedule` VALUES ('375', '9', '2012-11-01 20:20:00', 'SD', null, 'KC', null, '0');
INSERT INTO `nflp_schedule` VALUES ('376', '9', '2012-11-04 13:00:00', 'CIN', null, 'DEN', null, '0');
INSERT INTO `nflp_schedule` VALUES ('377', '9', '2012-11-04 13:00:00', 'CLE', null, 'BAL', null, '0');
INSERT INTO `nflp_schedule` VALUES ('378', '9', '2012-11-04 13:00:00', 'GB', null, 'ARI', null, '0');
INSERT INTO `nflp_schedule` VALUES ('379', '9', '2012-11-04 13:00:00', 'TEN', null, 'CHI', null, '0');
INSERT INTO `nflp_schedule` VALUES ('380', '9', '2012-11-04 13:00:00', 'IND', null, 'MIA', null, '0');
INSERT INTO `nflp_schedule` VALUES ('381', '9', '2012-11-04 13:00:00', 'WAS', null, 'CAR', null, '0');
INSERT INTO `nflp_schedule` VALUES ('382', '9', '2012-11-04 13:00:00', 'JAX', null, 'DET', null, '0');
INSERT INTO `nflp_schedule` VALUES ('383', '9', '2012-11-04 13:00:00', 'HOU', null, 'BUF', null, '0');
INSERT INTO `nflp_schedule` VALUES ('384', '9', '2012-11-04 16:05:00', 'OAK', null, 'TB', null, '0');
INSERT INTO `nflp_schedule` VALUES ('385', '9', '2012-11-04 16:05:00', 'SEA', null, 'MIN', null, '0');
INSERT INTO `nflp_schedule` VALUES ('386', '9', '2012-11-04 16:25:00', 'NYG', null, 'PIT', null, '0');
INSERT INTO `nflp_schedule` VALUES ('387', '9', '2012-11-04 20:20:00', 'ATL', null, 'DAL', null, '0');
INSERT INTO `nflp_schedule` VALUES ('388', '9', '2012-11-05 20:30:00', 'NO', null, 'PHI', null, '0');
INSERT INTO `nflp_schedule` VALUES ('389', '10', '2012-11-08 20:20:00', 'JAX', null, 'IND', null, '0');
INSERT INTO `nflp_schedule` VALUES ('390', '10', '2012-11-11 13:00:00', 'CIN', null, 'NYG', null, '0');
INSERT INTO `nflp_schedule` VALUES ('391', '10', '2012-11-11 13:00:00', 'MIA', null, 'TEN', null, '0');
INSERT INTO `nflp_schedule` VALUES ('392', '10', '2012-11-11 13:00:00', 'MIN', null, 'DET', null, '0');
INSERT INTO `nflp_schedule` VALUES ('393', '10', '2012-11-11 13:00:00', 'NE', null, 'BUF', null, '0');
INSERT INTO `nflp_schedule` VALUES ('394', '10', '2012-11-11 13:00:00', 'NO', null, 'ATL', null, '0');
INSERT INTO `nflp_schedule` VALUES ('395', '10', '2012-11-11 13:00:00', 'TB', null, 'SD', null, '0');
INSERT INTO `nflp_schedule` VALUES ('396', '10', '2012-11-11 13:00:00', 'CAR', null, 'DEN', null, '0');
INSERT INTO `nflp_schedule` VALUES ('397', '10', '2012-11-11 13:00:00', 'BAL', null, 'OAK', null, '0');
INSERT INTO `nflp_schedule` VALUES ('398', '10', '2012-11-11 16:05:00', 'SEA', null, 'NYJ', null, '0');
INSERT INTO `nflp_schedule` VALUES ('399', '10', '2012-11-11 16:25:00', 'PHI', null, 'DAL', null, '0');
INSERT INTO `nflp_schedule` VALUES ('400', '10', '2012-11-11 16:25:00', 'SF', null, 'STL', null, '0');
INSERT INTO `nflp_schedule` VALUES ('401', '10', '2012-11-11 20:20:00', 'CHI', null, 'HOU', null, '0');
INSERT INTO `nflp_schedule` VALUES ('402', '10', '2012-11-12 20:30:00', 'PIT', null, 'KC', null, '0');
INSERT INTO `nflp_schedule` VALUES ('403', '11', '2012-11-15 20:20:00', 'BUF', null, 'MIA', null, '0');
INSERT INTO `nflp_schedule` VALUES ('404', '11', '2012-11-18 13:00:00', 'ATL', null, 'ARI', null, '0');
INSERT INTO `nflp_schedule` VALUES ('405', '11', '2012-11-18 13:00:00', 'DAL', null, 'CLE', null, '0');
INSERT INTO `nflp_schedule` VALUES ('406', '11', '2012-11-18 13:00:00', 'DET', null, 'GB', null, '0');
INSERT INTO `nflp_schedule` VALUES ('407', '11', '2012-11-18 13:00:00', 'KC', null, 'CIN', null, '0');
INSERT INTO `nflp_schedule` VALUES ('408', '11', '2012-11-18 13:00:00', 'STL', null, 'NYJ', null, '0');
INSERT INTO `nflp_schedule` VALUES ('409', '11', '2012-11-18 13:00:00', 'NE', null, 'IND', null, '0');
INSERT INTO `nflp_schedule` VALUES ('410', '11', '2012-11-18 13:00:00', 'WAS', null, 'PHI', null, '0');
INSERT INTO `nflp_schedule` VALUES ('411', '11', '2012-11-18 13:00:00', 'CAR', null, 'TB', null, '0');
INSERT INTO `nflp_schedule` VALUES ('412', '11', '2012-11-18 13:00:00', 'HOU', null, 'JAX', null, '0');
INSERT INTO `nflp_schedule` VALUES ('413', '11', '2012-11-18 16:05:00', 'OAK', null, 'NO', null, '0');
INSERT INTO `nflp_schedule` VALUES ('414', '11', '2012-11-18 16:25:00', 'DEN', null, 'SD', null, '0');
INSERT INTO `nflp_schedule` VALUES ('415', '11', '2012-11-18 20:20:00', 'PIT', null, 'BAL', null, '0');
INSERT INTO `nflp_schedule` VALUES ('416', '11', '2012-11-19 20:30:00', 'SF', null, 'CHI', null, '0');
INSERT INTO `nflp_schedule` VALUES ('417', '12', '2012-11-22 12:30:00', 'DET', null, 'HOU', null, '0');
INSERT INTO `nflp_schedule` VALUES ('418', '12', '2012-11-22 16:15:00', 'DAL', null, 'WAS', null, '0');
INSERT INTO `nflp_schedule` VALUES ('419', '12', '2012-11-22 20:20:00', 'NYJ', null, 'NE', null, '0');
INSERT INTO `nflp_schedule` VALUES ('420', '12', '2012-11-25 13:00:00', 'CHI', null, 'MIN', null, '0');
INSERT INTO `nflp_schedule` VALUES ('421', '12', '2012-11-25 13:00:00', 'CIN', null, 'OAK', null, '0');
INSERT INTO `nflp_schedule` VALUES ('422', '12', '2012-11-25 13:00:00', 'CLE', null, 'PIT', null, '0');
INSERT INTO `nflp_schedule` VALUES ('423', '12', '2012-11-25 13:00:00', 'IND', null, 'BUF', null, '0');
INSERT INTO `nflp_schedule` VALUES ('424', '12', '2012-11-25 13:00:00', 'KC', null, 'DEN', null, '0');
INSERT INTO `nflp_schedule` VALUES ('425', '12', '2012-11-25 13:00:00', 'MIA', null, 'SEA', null, '0');
INSERT INTO `nflp_schedule` VALUES ('426', '12', '2012-11-25 13:00:00', 'TB', null, 'ATL', null, '0');
INSERT INTO `nflp_schedule` VALUES ('427', '12', '2012-11-25 13:00:00', 'JAX', null, 'TEN', null, '0');
INSERT INTO `nflp_schedule` VALUES ('428', '12', '2012-11-25 16:05:00', 'SD', null, 'BAL', null, '0');
INSERT INTO `nflp_schedule` VALUES ('429', '12', '2012-11-25 16:25:00', 'NO', null, 'SF', null, '0');
INSERT INTO `nflp_schedule` VALUES ('430', '12', '2012-11-25 16:25:00', 'ARI', null, 'STL', null, '0');
INSERT INTO `nflp_schedule` VALUES ('431', '12', '2012-11-25 20:20:00', 'NYG', null, 'GB', null, '0');
INSERT INTO `nflp_schedule` VALUES ('432', '12', '2012-11-26 20:30:00', 'PHI', null, 'CAR', null, '0');
INSERT INTO `nflp_schedule` VALUES ('433', '13', '2012-11-29 20:20:00', 'ATL', null, 'NO', null, '0');
INSERT INTO `nflp_schedule` VALUES ('434', '13', '2012-12-02 13:00:00', 'BUF', null, 'JAX', null, '0');
INSERT INTO `nflp_schedule` VALUES ('435', '13', '2012-12-02 13:00:00', 'CHI', null, 'SEA', null, '0');
INSERT INTO `nflp_schedule` VALUES ('436', '13', '2012-12-02 13:00:00', 'DET', null, 'IND', null, '0');
INSERT INTO `nflp_schedule` VALUES ('437', '13', '2012-12-02 13:00:00', 'GB', null, 'MIN', null, '0');
INSERT INTO `nflp_schedule` VALUES ('438', '13', '2012-12-02 13:00:00', 'TEN', null, 'HOU', null, '0');
INSERT INTO `nflp_schedule` VALUES ('439', '13', '2012-12-02 13:00:00', 'KC', null, 'CAR', null, '0');
INSERT INTO `nflp_schedule` VALUES ('440', '13', '2012-12-02 13:00:00', 'STL', null, 'SF', null, '0');
INSERT INTO `nflp_schedule` VALUES ('441', '13', '2012-12-02 13:00:00', 'MIA', null, 'NE', null, '0');
INSERT INTO `nflp_schedule` VALUES ('442', '13', '2012-12-02 13:00:00', 'NYJ', null, 'ARI', null, '0');
INSERT INTO `nflp_schedule` VALUES ('443', '13', '2012-12-02 16:05:00', 'DEN', null, 'TB', null, '0');
INSERT INTO `nflp_schedule` VALUES ('444', '13', '2012-12-02 16:25:00', 'OAK', null, 'CLE', null, '0');
INSERT INTO `nflp_schedule` VALUES ('445', '13', '2012-12-02 16:25:00', 'SD', null, 'CIN', null, '0');
INSERT INTO `nflp_schedule` VALUES ('446', '13', '2012-12-02 16:25:00', 'BAL', null, 'PIT', null, '0');
INSERT INTO `nflp_schedule` VALUES ('447', '13', '2012-12-02 20:20:00', 'DAL', null, 'PHI', null, '0');
INSERT INTO `nflp_schedule` VALUES ('448', '13', '2012-12-03 20:30:00', 'WAS', null, 'NYG', null, '0');
INSERT INTO `nflp_schedule` VALUES ('449', '14', '2012-12-06 20:20:00', 'OAK', null, 'DEN', null, '0');
INSERT INTO `nflp_schedule` VALUES ('450', '14', '2012-12-09 13:00:00', 'BUF', null, 'STL', null, '0');
INSERT INTO `nflp_schedule` VALUES ('451', '14', '2012-12-09 13:00:00', 'CIN', null, 'DAL', null, '0');
INSERT INTO `nflp_schedule` VALUES ('452', '14', '2012-12-09 13:00:00', 'CLE', null, 'KC', null, '0');
INSERT INTO `nflp_schedule` VALUES ('453', '14', '2012-12-09 13:00:00', 'IND', null, 'TEN', null, '0');
INSERT INTO `nflp_schedule` VALUES ('454', '14', '2012-12-09 13:00:00', 'MIN', null, 'CHI', null, '0');
INSERT INTO `nflp_schedule` VALUES ('455', '14', '2012-12-09 13:00:00', 'PIT', null, 'SD', null, '0');
INSERT INTO `nflp_schedule` VALUES ('456', '14', '2012-12-09 13:00:00', 'TB', null, 'PHI', null, '0');
INSERT INTO `nflp_schedule` VALUES ('457', '14', '2012-12-09 13:00:00', 'WAS', null, 'BAL', null, '0');
INSERT INTO `nflp_schedule` VALUES ('458', '14', '2012-12-09 13:00:00', 'CAR', null, 'ATL', null, '0');
INSERT INTO `nflp_schedule` VALUES ('459', '14', '2012-12-09 13:00:00', 'JAX', null, 'NYJ', null, '0');
INSERT INTO `nflp_schedule` VALUES ('460', '14', '2012-12-09 16:05:00', 'SF', null, 'MIA', null, '0');
INSERT INTO `nflp_schedule` VALUES ('461', '14', '2012-12-09 16:25:00', 'NYG', null, 'NO', null, '0');
INSERT INTO `nflp_schedule` VALUES ('462', '14', '2012-12-09 16:25:00', 'SEA', null, 'ARI', null, '0');
INSERT INTO `nflp_schedule` VALUES ('463', '14', '2012-12-09 20:20:00', 'GB', null, 'DET', null, '0');
INSERT INTO `nflp_schedule` VALUES ('464', '14', '2012-12-10 20:30:00', 'NE', null, 'HOU', null, '0');
INSERT INTO `nflp_schedule` VALUES ('465', '15', '2012-12-13 20:20:00', 'PHI', null, 'CIN', null, '0');
INSERT INTO `nflp_schedule` VALUES ('466', '15', '2012-12-16 13:00:00', 'ATL', null, 'NYG', null, '0');
INSERT INTO `nflp_schedule` VALUES ('467', '15', '2012-12-16 13:00:00', 'CHI', null, 'GB', null, '0');
INSERT INTO `nflp_schedule` VALUES ('468', '15', '2012-12-16 13:00:00', 'CLE', null, 'WAS', null, '0');
INSERT INTO `nflp_schedule` VALUES ('469', '15', '2012-12-16 13:00:00', 'STL', null, 'MIN', null, '0');
INSERT INTO `nflp_schedule` VALUES ('470', '15', '2012-12-16 13:00:00', 'MIA', null, 'JAX', null, '0');
INSERT INTO `nflp_schedule` VALUES ('471', '15', '2012-12-16 13:00:00', 'NO', null, 'TB', null, '0');
INSERT INTO `nflp_schedule` VALUES ('472', '15', '2012-12-16 13:00:00', 'BAL', null, 'DEN', null, '0');
INSERT INTO `nflp_schedule` VALUES ('473', '15', '2012-12-16 13:00:00', 'HOU', null, 'IND', null, '0');
INSERT INTO `nflp_schedule` VALUES ('474', '15', '2012-12-16 16:05:00', 'BUF', null, 'SEA', null, '0');
INSERT INTO `nflp_schedule` VALUES ('475', '15', '2012-12-16 16:05:00', 'ARI', null, 'DET', null, '0');
INSERT INTO `nflp_schedule` VALUES ('476', '15', '2012-12-16 16:05:00', 'SD', null, 'CAR', null, '0');
INSERT INTO `nflp_schedule` VALUES ('477', '15', '2012-12-16 16:25:00', 'DAL', null, 'PIT', null, '0');
INSERT INTO `nflp_schedule` VALUES ('478', '15', '2012-12-16 16:25:00', 'OAK', null, 'KC', null, '0');
INSERT INTO `nflp_schedule` VALUES ('479', '15', '2012-12-16 20:20:00', 'NE', null, 'SF', null, '0');
INSERT INTO `nflp_schedule` VALUES ('480', '15', '2012-12-17 20:30:00', 'TEN', null, 'NYJ', null, '0');
INSERT INTO `nflp_schedule` VALUES ('481', '16', '2012-12-22 20:30:00', 'DET', null, 'ATL', null, '0');
INSERT INTO `nflp_schedule` VALUES ('482', '16', '2012-12-23 13:00:00', 'DAL', null, 'NO', null, '0');
INSERT INTO `nflp_schedule` VALUES ('483', '16', '2012-12-23 13:00:00', 'GB', null, 'TEN', null, '0');
INSERT INTO `nflp_schedule` VALUES ('484', '16', '2012-12-23 13:00:00', 'KC', null, 'IND', null, '0');
INSERT INTO `nflp_schedule` VALUES ('485', '16', '2012-12-23 13:00:00', 'MIA', null, 'BUF', null, '0');
INSERT INTO `nflp_schedule` VALUES ('486', '16', '2012-12-23 13:00:00', 'PHI', null, 'WAS', null, '0');
INSERT INTO `nflp_schedule` VALUES ('487', '16', '2012-12-23 13:00:00', 'PIT', null, 'CIN', null, '0');
INSERT INTO `nflp_schedule` VALUES ('488', '16', '2012-12-23 13:00:00', 'TB', null, 'STL', null, '0');
INSERT INTO `nflp_schedule` VALUES ('489', '16', '2012-12-23 13:00:00', 'CAR', null, 'OAK', null, '0');
INSERT INTO `nflp_schedule` VALUES ('490', '16', '2012-12-23 13:00:00', 'JAX', null, 'NE', null, '0');
INSERT INTO `nflp_schedule` VALUES ('491', '16', '2012-12-23 13:00:00', 'BAL', null, 'NYG', null, '0');
INSERT INTO `nflp_schedule` VALUES ('492', '16', '2012-12-23 13:00:00', 'HOU', null, 'MIN', null, '0');
INSERT INTO `nflp_schedule` VALUES ('493', '16', '2012-12-23 16:05:00', 'DEN', null, 'CLE', null, '0');
INSERT INTO `nflp_schedule` VALUES ('494', '16', '2012-12-23 16:25:00', 'ARI', null, 'CHI', null, '0');
INSERT INTO `nflp_schedule` VALUES ('495', '16', '2012-12-23 16:25:00', 'SEA', null, 'SF', null, '0');
INSERT INTO `nflp_schedule` VALUES ('496', '16', '2012-12-23 20:20:00', 'NYJ', null, 'SD', null, '0');
INSERT INTO `nflp_schedule` VALUES ('497', '17', '2012-12-30 13:00:00', 'ATL', null, 'TB', null, '0');
INSERT INTO `nflp_schedule` VALUES ('498', '17', '2012-12-30 13:00:00', 'BUF', null, 'NYJ', null, '0');
INSERT INTO `nflp_schedule` VALUES ('499', '17', '2012-12-30 13:00:00', 'CIN', null, 'BAL', null, '0');
INSERT INTO `nflp_schedule` VALUES ('500', '17', '2012-12-30 13:00:00', 'DET', null, 'CHI', null, '0');
INSERT INTO `nflp_schedule` VALUES ('501', '17', '2012-12-30 13:00:00', 'TEN', null, 'JAX', null, '0');
INSERT INTO `nflp_schedule` VALUES ('502', '17', '2012-12-30 13:00:00', 'IND', null, 'HOU', null, '0');
INSERT INTO `nflp_schedule` VALUES ('503', '17', '2012-12-30 13:00:00', 'MIN', null, 'GB', null, '0');
INSERT INTO `nflp_schedule` VALUES ('504', '17', '2012-12-30 13:00:00', 'NE', null, 'MIA', null, '0');
INSERT INTO `nflp_schedule` VALUES ('505', '17', '2012-12-30 13:00:00', 'NO', null, 'CAR', null, '0');
INSERT INTO `nflp_schedule` VALUES ('506', '17', '2012-12-30 13:00:00', 'NYG', null, 'PHI', null, '0');
INSERT INTO `nflp_schedule` VALUES ('507', '17', '2012-12-30 13:00:00', 'PIT', null, 'CLE', null, '0');
INSERT INTO `nflp_schedule` VALUES ('508', '17', '2012-12-30 13:00:00', 'WAS', null, 'DAL', null, '0');
INSERT INTO `nflp_schedule` VALUES ('509', '17', '2012-12-30 16:25:00', 'DEN', null, 'KC', null, '0');
INSERT INTO `nflp_schedule` VALUES ('510', '17', '2012-12-30 16:25:00', 'SD', null, 'OAK', null, '0');
INSERT INTO `nflp_schedule` VALUES ('511', '17', '2012-12-30 16:25:00', 'SF', null, 'ARI', null, '0');
INSERT INTO `nflp_schedule` VALUES ('512', '17', '2012-12-30 16:25:00', 'SEA', null, 'STL', null, '0');

-- ----------------------------
-- Table structure for `nflp_teams`
-- ----------------------------
DROP TABLE IF EXISTS `nflp_teams`;
CREATE TABLE `nflp_teams` (
  `teamID` varchar(10) NOT NULL,
  `divisionID` int(11) NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `team` varchar(50) DEFAULT NULL,
  `displayName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`teamID`),
  KEY `ID` (`teamID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nflp_teams
-- ----------------------------
INSERT INTO `nflp_teams` VALUES ('ARI', '8', 'Arizona', 'Cardinals', null);
INSERT INTO `nflp_teams` VALUES ('ATL', '6', 'Atlanta', 'Falcons', null);
INSERT INTO `nflp_teams` VALUES ('BAL', '1', 'Baltimore', 'Ravens', null);
INSERT INTO `nflp_teams` VALUES ('BUF', '3', 'Buffalo', 'Bills', null);
INSERT INTO `nflp_teams` VALUES ('CAR', '6', 'Carolina', 'Panthers', null);
INSERT INTO `nflp_teams` VALUES ('CHI', '5', 'Chicago', 'Bears', null);
INSERT INTO `nflp_teams` VALUES ('CIN', '1', 'Cincinnati', 'Bengals', null);
INSERT INTO `nflp_teams` VALUES ('CLE', '1', 'Cleveland', 'Browns', null);
INSERT INTO `nflp_teams` VALUES ('DAL', '7', 'Dallas', 'Cowboys', null);
INSERT INTO `nflp_teams` VALUES ('DEN', '4', 'Denver', 'Broncos', null);
INSERT INTO `nflp_teams` VALUES ('DET', '5', 'Detroit', 'Lions', null);
INSERT INTO `nflp_teams` VALUES ('GB', '5', 'Green Bay', 'Packers', null);
INSERT INTO `nflp_teams` VALUES ('HOU', '2', 'Houston', 'Texans', null);
INSERT INTO `nflp_teams` VALUES ('IND', '2', 'Indianapolis', 'Colts', null);
INSERT INTO `nflp_teams` VALUES ('JAX', '2', 'Jacksonville', 'Jaguars', null);
INSERT INTO `nflp_teams` VALUES ('KC', '4', 'Kansas City', 'Chiefs', null);
INSERT INTO `nflp_teams` VALUES ('MIA', '3', 'Miami', 'Dolphins', null);
INSERT INTO `nflp_teams` VALUES ('MIN', '5', 'Minnesota', 'Vikings', null);
INSERT INTO `nflp_teams` VALUES ('NE', '3', 'New England', 'Patriots', null);
INSERT INTO `nflp_teams` VALUES ('NO', '6', 'New Orleans', 'Saints', null);
INSERT INTO `nflp_teams` VALUES ('NYG', '7', 'New York', 'Giants', 'NY Giants');
INSERT INTO `nflp_teams` VALUES ('NYJ', '3', 'New York', 'Jets', 'NY Jets');
INSERT INTO `nflp_teams` VALUES ('OAK', '4', 'Oakland', 'Raiders', null);
INSERT INTO `nflp_teams` VALUES ('PHI', '7', 'Philadelphia', 'Eagles', null);
INSERT INTO `nflp_teams` VALUES ('PIT', '1', 'Pittsburgh', 'Steelers', null);
INSERT INTO `nflp_teams` VALUES ('SD', '4', 'San Diego', 'Chargers', null);
INSERT INTO `nflp_teams` VALUES ('SEA', '8', 'Seattle', 'Seahawks', null);
INSERT INTO `nflp_teams` VALUES ('SF', '8', 'San Francisco', '49ers', null);
INSERT INTO `nflp_teams` VALUES ('STL', '8', 'St. Louis', 'Rams', null);
INSERT INTO `nflp_teams` VALUES ('TB', '6', 'Tampa Bay', 'Buccaneers', null);
INSERT INTO `nflp_teams` VALUES ('TEN', '2', 'Tennessee', 'Titans', null);
INSERT INTO `nflp_teams` VALUES ('WAS', '7', 'Washington', 'Redskins', null);

-- ----------------------------
-- Table structure for `nflp_users`
-- ----------------------------
DROP TABLE IF EXISTS `nflp_users`;
CREATE TABLE `nflp_users` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`userID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nflp_users
-- ----------------------------
INSERT INTO `nflp_users` VALUES ('1', 'admin', 'jl7LZ1B7ZNUq/RnVqnFmuwRXvMkO/DD5', 'Cb8Jjj0OPy', 'Admin', 'Admin', 'admin@yourdomain.com', '1');
