CREATE TABLE Teams(
	team_id	int4 PRIMARY KEY,
	min_year int4,
	abbreviation varchar(5),
	nickname varchar(20),
	yearfounded int4,
	city varchar(50)
);

CREATE TABLE Games(
	game_date_est date,
	game_id int4 PRIMARY KEY,
	game_status varchar(10),
	home_team_id int4,
	visitor_team_id int4,
	season int4,
	pts_home int4,
	fg_pct_home float4,
	ft_pct_home	float4,
	fg3_pct_home float4,
	ast_home int4,
	reb_home int4,
	pts_away int4,
	fg_pct_away float4,
	ft_pct_away float4,
	fg3_pct_away float4,
	ast_away int4,
	reb_away int4,
	home_team_wins int4,
	FOREIGN KEY (home_team_id) REFERENCES Teams(team_id),
	FOREIGN KEY (visitor_team_id) REFERENCES Teams(team_id)
);

CREATE TABLE GamesDetails(
	game_id int4,
	team_id	int4,
	player_id int4,
	player_name varchar(50),
	fgm int4,
	fga int4,
	fg_pct float4,
	fg3m int4,
	fg3a int4,
	fg3_pct float4,
	ftm int4,
	fta int4,
	ft_pct float4,
	oreb int4,
	dreb int4,
	reb int4,
	ast int4,
	stl int4,
	blk int4,
	foul int4,
	pf int4,
	pts int4,
	plus_minus int4,
	PRIMARY KEY(game_id, player_id),
	FOREIGN KEY (team_id) REFERENCES Teams(team_id),
	FOREIGN KEY (game_id) REFERENCES Games(game_id)
);

CREATE TABLE Players(
	player_name	varchar(50),
	team_id	int4,
	player_id int4,
	season int4,
	PRIMARY KEY(team_id, player_id, season),
	FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

CREATE TABLE Ranking(
	team_id	int4,
	season_id int4,
	standingsdate date,
	conference varchar(10),
	team varchar(50),
	g int4,
	w int4,
	l int4,
	w_pct float4,
	home_record varchar(10),
	road_record varchar(10),
	PRIMARY KEY (team_id, standingsdate),
	FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);