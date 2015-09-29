/*

	 /$$   /$$  /$$$$$$          /$$$$$$$  /$$$$$$$
	| $$$ | $$ /$$__  $$        | $$__  $$| $$__  $$
	| $$$$| $$| $$  \__/        | $$  \ $$| $$  \ $$
	| $$ $$ $$| $$ /$$$$ /$$$$$$| $$$$$$$/| $$$$$$$/
	| $$  $$$$| $$|_  $$|______/| $$__  $$| $$____/
	| $$\  $$$| $$  \ $$        | $$  \ $$| $$
	| $$ \  $$|  $$$$$$/        | $$  | $$| $$
	|__/  \__/ \______/         |__/  |__/|__/

					Dynamic Arrestpoint System 

				Next Generation Gaming, LLC
	(created by Next Generation Gaming Development Team)
					
	* Copyright (c) 2014, Next Generation Gaming, LLC
	*
	* All rights reserved.
	*
	* Redistribution and use in source and binary forms, with or without modification,
	* are not permitted in any case.
	*
	*
	* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
	* "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
	* LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
	* A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
	* CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
	* EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
	* PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
	* PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
	* LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
	* NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
	* SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

#include <YSI\y_hooks>


stock LoadArrestPoint(id)
{
	new string[128];
	format(string, sizeof(string), "SELECT * FROM `arrestpoints` WHERE `id`=%d", id);
	mysql_function_query(MainPipeline, string, true, "OnLoadArrestPoints", "i", id);
}

stock LoadArrestPoints()
{
	printf("[LoadArrestPoints] Loading data from database...");
	mysql_function_query(MainPipeline, "SELECT * FROM `arrestpoints`", true, "OnLoadArrestPoints", "");
}

forward OnLoadArrestPoint(index);
public OnLoadArrestPoint(index)
{
	new rows, fields;
	szMiscArray[0] = 0;
	cache_get_data(rows, fields, MainPipeline);

	for(new row; row < rows; row++)
	{
		ArrestPoints[index][arrestSQLId] = cache_get_field_content_int(row, "id", MainPipeline);
		ArrestPoints[index][arrestPosX] = cache_get_field_content_float(row, "PosX", MainPipeline);
		ArrestPoints[index][arrestPosY] = cache_get_field_content_float(row, "PosY", MainPipeline);
		ArrestPoints[index][arrestPosZ] = cache_get_field_content_float(row, "PosZ", MainPipeline);
		ArrestPoints[index][arrestVW] = cache_get_field_content_int(row, "VW", MainPipeline); 
		ArrestPoints[index][arrestInt] = cache_get_field_content_int(row, "Int", MainPipeline); 
		ArrestPoints[index][arrestType] = cache_get_field_content_int(row, "Type", MainPipeline);

		if(ArrestPoints[index][arrestPosX] != 0)
		{
			switch(ArrestPoints[index][arrestType])
			{
				case 0:
				{
					format(szMiscArray, sizeof(szMiscArray), "Press Y to arrest\nArrest Point #%d", index);
					ArrestPoints[index][arrestTextID] = CreateDynamic3DTextLabel(szMiscArray, COLOR_DBLUE, ArrestPoints[index][arrestPosX], ArrestPoints[index][arrestPosY], ArrestPoints[index][arrestPosZ]+0.6, 4.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, ArrestPoints[index][arrestVW], ArrestPoints[index][arrestInt], -1);
					ArrestPoints[index][arrestPickupID] = CreateDynamicPickup(1247, 23, ArrestPoints[index][arrestPosX], ArrestPoints[index][arrestPosY], ArrestPoints[index][arrestPosZ], ArrestPoints[index][arrestVW]);
					ArrestPoints[index][arrest_iAreaID] = CreateDynamicSphere(ArrestPoints[index][arrestPosX], ArrestPoints[index][arrestPosY], ArrestPoints[index][arrestPosZ], 4.0, ArrestPoints[index][arrestVW]);
				}
				case 2:
				{
					format(szMiscArray, sizeof(szMiscArray), "Press Y to arrest\nArrest Point #%d", index);
					ArrestPoints[index][arrestTextID] = CreateDynamic3DTextLabel(szMiscArray, COLOR_DBLUE, ArrestPoints[index][arrestPosX], ArrestPoints[index][arrestPosY], ArrestPoints[index][arrestPosZ]+0.6, 4.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, ArrestPoints[index][arrestVW], ArrestPoints[index][arrestInt], -1);
					ArrestPoints[index][arrestPickupID] = CreateDynamicPickup(1247, 23, ArrestPoints[index][arrestPosX], ArrestPoints[index][arrestPosY], ArrestPoints[index][arrestPosZ], ArrestPoints[index][arrestVW]);
					ArrestPoints[index][arrest_iAreaID] = CreateDynamicSphere(ArrestPoints[index][arrestPosX], ArrestPoints[index][arrestPosY], ArrestPoints[index][arrestPosZ], 50.0, ArrestPoints[index][arrestVW]);
				}
				case 3:
				{
					format(szMiscArray, sizeof(szMiscArray), "Press Y to arrest\nArrest Point #%d", index);
					ArrestPoints[index][arrestTextID] = CreateDynamic3DTextLabel(szMiscArray, COLOR_DBLUE, ArrestPoints[index][arrestPosX], ArrestPoints[index][arrestPosY], ArrestPoints[index][arrestPosZ]+0.6, 4.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, ArrestPoints[index][arrestVW], ArrestPoints[index][arrestInt], -1);
					ArrestPoints[index][arrestPickupID] = CreateDynamicPickup(1247, 23, ArrestPoints[index][arrestPosX], ArrestPoints[index][arrestPosY], ArrestPoints[index][arrestPosZ], ArrestPoints[index][arrestVW]);
					ArrestPoints[index][arrest_iAreaID] = CreateDynamicSphere(ArrestPoints[index][arrestPosX], ArrestPoints[index][arrestPosY], ArrestPoints[index][arrestPosZ], 10.0, ArrestPoints[index][arrestVW]);
					ArrestPoints[index][arrest_iAreaID] = CreateDynamicSphere(ArrestPoints[index][arrestPosX], ArrestPoints[index][arrestPosY], ArrestPoints[index][arrestPosZ], 4.0, ArrestPoints[index][arrestVW]);
				}
				case 4:
				{
					format(szMiscArray, sizeof(szMiscArray), "Press Y to arrest\nArrest Point #%d", index);
					ArrestPoints[index][arrestTextID] = CreateDynamic3DTextLabel(szMiscArray, COLOR_DBLUE, ArrestPoints[index][arrestPosX], ArrestPoints[index][arrestPosY], ArrestPoints[index][arrestPosZ]+0.6, 4.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, ArrestPoints[index][arrestVW], ArrestPoints[index][arrestInt], -1);
					ArrestPoints[index][arrestPickupID] = CreateDynamicPickup(1247, 23, ArrestPoints[index][arrestPosX], ArrestPoints[index][arrestPosY], ArrestPoints[index][arrestPosZ], ArrestPoints[index][arrestVW]);
					ArrestPoints[index][arrest_iAreaID] = CreateDynamicSphere(ArrestPoints[index][arrestPosX], ArrestPoints[index][arrestPosY], ArrestPoints[index][arrestPosZ], 4.0, ArrestPoints[index][arrestVW]);
				}
			}
		}
	}
	return 1;
}

forward OnLoadArrestPoints();
public OnLoadArrestPoints()
{
	new i, rows, fields;
	szMiscArray[0] = 0;
	cache_get_data(rows, fields, MainPipeline);

	while(i < rows)
	{
		ArrestPoints[i][arrestSQLId] = cache_get_field_content_int(i, "id", MainPipeline);
		ArrestPoints[i][arrestPosX] = cache_get_field_content_float(i, "PosX", MainPipeline);
		ArrestPoints[i][arrestPosY] = cache_get_field_content_float(i, "PosY", MainPipeline);
		ArrestPoints[i][arrestPosZ] = cache_get_field_content_float(i, "PosZ", MainPipeline);
		ArrestPoints[i][arrestVW] = cache_get_field_content_int(i, "VW", MainPipeline); 
		ArrestPoints[i][arrestInt] = cache_get_field_content_int(i, "Int", MainPipeline); 
		ArrestPoints[i][arrestType] = cache_get_field_content_int(i, "Type", MainPipeline); 
		ArrestPoints[i][jailVW] = cache_get_field_content_int(i, "jailVW", MainPipeline); 
		ArrestPoints[i][jailInt] = cache_get_field_content_int(i, "jailInt", MainPipeline);
		ArrestPoints[i][JailPos1][0] = cache_get_field_content_float(i, "jailpos1x", MainPipeline);
		ArrestPoints[i][JailPos1][1] = cache_get_field_content_float(i, "jailpos1y", MainPipeline);
		ArrestPoints[i][JailPos1][2] = cache_get_field_content_float(i, "jailpos1z", MainPipeline);
		ArrestPoints[i][JailPos2][0] = cache_get_field_content_float(i, "jailpos2x", MainPipeline);
		ArrestPoints[i][JailPos2][1] = cache_get_field_content_float(i, "jailpos2y", MainPipeline);
		ArrestPoints[i][JailPos2][2] = cache_get_field_content_float(i, "jailpos2z", MainPipeline);
		if(ArrestPoints[i][arrestPosX] != 0)
		{
			switch(ArrestPoints[i][arrestType])
			{
				case 0:
				{
					format(szMiscArray, sizeof(szMiscArray), "Press Y to arrest\nArrest Point #%d", i);
					ArrestPoints[i][arrestTextID] = CreateDynamic3DTextLabel(szMiscArray, COLOR_DBLUE, ArrestPoints[i][arrestPosX], ArrestPoints[i][arrestPosY], ArrestPoints[i][arrestPosZ]+0.6, 4.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, ArrestPoints[i][arrestVW], ArrestPoints[i][arrestInt], -1);
					ArrestPoints[i][arrestPickupID] = CreateDynamicPickup(1247, 23, ArrestPoints[i][arrestPosX], ArrestPoints[i][arrestPosY], ArrestPoints[i][arrestPosZ], ArrestPoints[i][arrestVW]);
					ArrestPoints[i][arrest_iAreaID] = CreateDynamicSphere(ArrestPoints[i][arrestPosX], ArrestPoints[i][arrestPosY], ArrestPoints[i][arrestPosZ], 4.0, ArrestPoints[i][arrestVW]);
				}
				case 2:
				{
					format(szMiscArray, sizeof(szMiscArray), "Press Y to arrest\nArrest Point #%d", i);
					ArrestPoints[i][arrestTextID] = CreateDynamic3DTextLabel(szMiscArray, COLOR_DBLUE, ArrestPoints[i][arrestPosX], ArrestPoints[i][arrestPosY], ArrestPoints[i][arrestPosZ]+0.6, 4.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, ArrestPoints[i][arrestVW], ArrestPoints[i][arrestInt], -1);
					ArrestPoints[i][arrestPickupID] = CreateDynamicPickup(1247, 23, ArrestPoints[i][arrestPosX], ArrestPoints[i][arrestPosY], ArrestPoints[i][arrestPosZ], ArrestPoints[i][arrestVW]);
					ArrestPoints[i][arrest_iAreaID] = CreateDynamicSphere(ArrestPoints[i][arrestPosX], ArrestPoints[i][arrestPosY], ArrestPoints[i][arrestPosZ], 50.0, ArrestPoints[i][arrestVW]);
				}
				case 3:
				{
					format(szMiscArray, sizeof(szMiscArray), "Press Y to arrest\nArrest Point #%d", i);
					ArrestPoints[i][arrestTextID] = CreateDynamic3DTextLabel(szMiscArray, COLOR_DBLUE, ArrestPoints[i][arrestPosX], ArrestPoints[i][arrestPosY], ArrestPoints[i][arrestPosZ]+0.6, 4.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, ArrestPoints[i][arrestVW], ArrestPoints[i][arrestInt], -1);
					ArrestPoints[i][arrestPickupID] = CreateDynamicPickup(1247, 23, ArrestPoints[i][arrestPosX], ArrestPoints[i][arrestPosY], ArrestPoints[i][arrestPosZ], ArrestPoints[i][arrestVW]);
					ArrestPoints[i][arrest_iAreaID] = CreateDynamicSphere(ArrestPoints[i][arrestPosX], ArrestPoints[i][arrestPosY], ArrestPoints[i][arrestPosZ], 10.0, ArrestPoints[i][arrestVW]);
					ArrestPoints[i][arrest_iAreaID] = CreateDynamicSphere(ArrestPoints[i][arrestPosX], ArrestPoints[i][arrestPosY], ArrestPoints[i][arrestPosZ], 4.0, ArrestPoints[i][arrestVW]);
				}
				case 4:
				{
					format(szMiscArray, sizeof(szMiscArray), "Press Y to arrest\nArrest Point #%d", i);
					ArrestPoints[i][arrestTextID] = CreateDynamic3DTextLabel(szMiscArray, COLOR_DBLUE, ArrestPoints[i][arrestPosX], ArrestPoints[i][arrestPosY], ArrestPoints[i][arrestPosZ]+0.6, 4.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, ArrestPoints[i][arrestVW], ArrestPoints[i][arrestInt], -1);
					ArrestPoints[i][arrestPickupID] = CreateDynamicPickup(1247, 23, ArrestPoints[i][arrestPosX], ArrestPoints[i][arrestPosY], ArrestPoints[i][arrestPosZ], ArrestPoints[i][arrestVW]);
					ArrestPoints[i][arrest_iAreaID] = CreateDynamicSphere(ArrestPoints[i][arrestPosX], ArrestPoints[i][arrestPosY], ArrestPoints[i][arrestPosZ], 4.0, ArrestPoints[i][arrestVW]);
				}
			}
		}
		i++;
	}
}

stock SaveArrestPoint(id)
{
	new string[1024];
	format(string, sizeof(string), "UPDATE `arrestpoints` SET \
		`PosX`=%f, \
		`PosY`=%f, \
		`PosZ`=%f, \
		`VW`=%d, \
		`Int`=%d, \
		`Type`=%d, \
		`jailVW`=%d, \
		`jailInt`=%d, \
		`jailpos1x`=%f, \
		`jailpos1y`=%f, \
		`jailpos1z`=%f, \
		`jailpos2x`=%f, \
		`jailpos2y`=%f, \
		`jailpos2z`=%f WHERE `id`=%d",
		ArrestPoints[id][arrestPosX],
		ArrestPoints[id][arrestPosY],
		ArrestPoints[id][arrestPosZ],
		ArrestPoints[id][arrestVW],
		ArrestPoints[id][arrestInt],
		ArrestPoints[id][arrestType],
		ArrestPoints[id][jailVW],
		ArrestPoints[id][jailInt],
		ArrestPoints[id][JailPos1][0],
		ArrestPoints[id][JailPos1][1],
		ArrestPoints[id][JailPos1][2],
		ArrestPoints[id][JailPos2][0],
		ArrestPoints[id][JailPos2][1],
		ArrestPoints[id][JailPos2][2],
		id
	);

	mysql_function_query(MainPipeline, string, false, "OnQueryFinish", "i", SENDDATA_THREAD);
}

stock SaveArrestPoints()
{
	for(new i = 0; i < MAX_ARRESTPOINTS; i++)
	{
		SaveArrestPoint(i);
	}
	return 1;
}

stock RehashArrestPoint(id)
{
	DestroyDynamic3DTextLabel(ArrestPoints[id][arrestTextID]);
	DestroyDynamicPickup(ArrestPoints[id][arrestPickupID]);
	ArrestPoints[id][arrestSQLId] = -1;
	ArrestPoints[id][arrestPosX] = 0.0;
	ArrestPoints[id][arrestPosY] = 0.0;
	ArrestPoints[id][arrestPosZ] = 0.0;
	ArrestPoints[id][arrestVW] = 0;
	ArrestPoints[id][arrestInt] = 0;
	ArrestPoints[id][arrestType] = 0;
	LoadArrestPoint(id);
}

stock RehashArrestPoints()
{
	printf("[RehashArrestPoints] Deleting Arrest Points from server...");
	for(new i = 0; i < MAX_ARRESTPOINTS; i++)
	{
		RehashArrestPoint(i);
	}
	LoadArrestPoints();
}

GetArrestPointID(playerid) {
	new a = -1;
	for(new x = 0; x < MAX_ARRESTPOINTS; x++) 
	{
		//if(IsPlayerInRangeOfPoint(playerid, 8.0, ArrestPoints[x][arrestPosX], ArrestPoints[x][arrestPosY], ArrestPoints[x][arrestPosZ]) && GetPlayerInterior(playerid) == ArrestPoints[x][arrestInt] && GetPlayerVirtualWorld(playerid) == ArrestPoints[x][arrestVW])
		if(IsPlayerInDynamicArea(playerid, ArrestPoints[x][arrest_iAreaID]))
		{
			a = x;
			break;
		}
	}
	return a;
}

ArrestProcess(playerid, id) {

	switch(id) {

		case 0: {

			if(!IsACop(playerid)) {
			    SendClientMessageEx(playerid, COLOR_GREY, "You are not part of a LEO faction. ");
			}
			else if(!IsAtArrestPoint(playerid) && !IsAtArrestPoint(playerid)) {
		 		SendClientMessageEx(playerid, COLOR_GREY, "You are not at a arrest point." );
		 	}

			else {


		   		new
					string[256];

		        new suspect = GetClosestPlayer(playerid);
				if(!IsPlayerConnected(suspect)) {
					SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
				}
				else if(!ProxDetectorS(5.0, playerid, suspect)) {
				    SendClientMessageEx(playerid, COLOR_GREY, "You are not close enough to the suspect.");
				}
				else if(PlayerInfo[suspect][pWantedLevel] < 1 && !IsAJudge(playerid)) {
				    SendClientMessageEx(playerid, COLOR_GREY, "The person must have a wanted level of at least one star.");
				}
				else {
					SetPVarInt(playerid, "Arrest_Price", PlayerInfo[suspect][pWantedJailFine]);
					SetPVarInt(playerid, "Arrest_Time", PlayerInfo[suspect][pWantedJailTime]);
					SetPVarInt(playerid, "Arrest_Bail", 1);
					SetPVarInt(playerid, "Arrest_BailPrice", PlayerInfo[suspect][pWantedJailFine]*2);
					SetPVarInt(playerid, "Arrest_Suspect", suspect);
					SetPVarInt(playerid, "Arrest_Type", 0);
					format(string, sizeof(string), "Please write a brief arrest report on how %s acted during the arrest.\n\nThis report must be at least 30 characters and no more than 128.", GetPlayerNameEx(suspect));
					ShowPlayerDialog(playerid, DIALOG_ARRESTREPORT, DIALOG_STYLE_INPUT, "Arrest Report", string, "Submit", "");
			    }
			}
		}
		case 1: {

			if(!IsACop(playerid)) SendClientMessageEx(playerid, COLOR_GREY, "You are not part of a LEO faction. ");
			else if(!IsAtArrestPoint(playerid)) SendClientMessageEx(playerid, COLOR_GREY, "You are not at the DoC Prison arrest point." );

			else
			{
		   		new
		     		//moneys,
		       		//time,
					string[256];

		        new suspect = GetClosestPlayer(playerid);
		  		/*if(sscanf(params, "dddd", moneys, time)) SendClientMessageEx(playerid, COLOR_GREY, "USAGE: /docarrest [fine] [minutes]");
				else if(!(1 <= moneys <= 250000)) SendClientMessageEx(playerid, COLOR_GREY, "The jail fine can't be below $1 or above $250,000.");
				else if(!(1 <= time <= 120)) SendClientMessageEx(playerid, COLOR_GREY, "Jail time can't be below 1 or above 120 minutes - take the person to prison for more time.");*/
				if(!IsPlayerConnected(suspect)) SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
				else if(!ProxDetectorS(5.0, playerid, suspect)) SendClientMessageEx(playerid, COLOR_GREY, "You are close enough to the suspect.");
				else if(PlayerInfo[suspect][pWantedLevel] < 1 && PlayerInfo[playerid][pMember] != 12) SendClientMessageEx(playerid, COLOR_GREY, "The person must have a wanted level of at least one star.");
				else {
					SetPVarInt(playerid, "Arrest_Price", PlayerInfo[suspect][pWantedJailFine]);
					SetPVarInt(playerid, "Arrest_Time", PlayerInfo[suspect][pWantedJailTime]);
					SetPVarInt(playerid, "Arrest_Bail", 1);
					SetPVarInt(playerid, "Arrest_BailPrice", PlayerInfo[suspect][pWantedJailFine]*2);
					SetPVarInt(playerid, "Arrest_Suspect", suspect);
					SetPVarInt(playerid, "Arrest_Type", 2);
					format(string, sizeof(string), "Please write a brief arrest report on how %s acted during the arrest.\n\nThis report must be at least 30 characters and no more than 128.", GetPlayerNameEx(suspect));
					ShowPlayerDialog(playerid, DIALOG_ARRESTREPORT, DIALOG_STYLE_INPUT, "Arrest Report", string, "Submit", "");
			    }
			}
		}
		case 2: {

			new string[256];
		    if(IsACop(playerid))
			{
			    if(JudgeOnlineCheck() == 0) return SendClientMessageEx(playerid, COLOR_GRAD4, "There must be at least one judge online to do this!");
		        if(!IsAtArrestPoint(playerid))
				{
		  			SendClientMessageEx(playerid, COLOR_GREY, "You aren't at a warrant arrest point.");
			    	return 1;
				}

				new suspect = GetClosestPlayer(playerid);
				if(IsPlayerConnected(suspect))
				{
					if(ProxDetectorS(5.0, playerid,suspect))
					{
						if(strlen(PlayerInfo[suspect][pWarrant]) < 1)
						{
			   				SendClientMessageEx(playerid, COLOR_GREY, "The person must have active warrants.");
						    return 1;
						}
						format(string, sizeof(string), "* You warrant arrested %s!", GetPlayerNameEx(suspect));
						SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
						ResetPlayerWeaponsEx(suspect);
						format(string, sizeof(string), "<< Defendant %s has been delivered to the courtroom pending trial by %s >>", GetPlayerNameEx(suspect), GetPlayerNameEx(playerid));
						SendGroupMessage(6, DEPTRADIO, string);
						SetPlayerInterior(suspect, 1);
						PlayerInfo[suspect][pInt] = 1;
						SetPlayerVirtualWorld(suspect, 0);
						PlayerInfo[suspect][pVW] = 0;
						new rand = random(sizeof(WarrantJail));
						SetPlayerFacingAngle(suspect, 0);
						SetPlayerPos(suspect, WarrantJail[rand][0], WarrantJail[rand][1], WarrantJail[rand][2]);
						if(rand != 0) courtjail[suspect] = 2;
						else courtjail[suspect] = 1;
						SetCameraBehindPlayer(suspect);
						DeletePVar(suspect, "IsFrozen");
						PlayerCuffed[suspect] = 0;
						DeletePVar(suspect, "PlayerCuffed");
						PlayerCuffedTime[suspect] = 0;
						PhoneOnline[suspect] = 1;
						PlayerInfo[suspect][pArrested] += 1;
						SetPlayerFree(suspect,playerid, "was warrant arrested");
						PlayerInfo[suspect][pWantedLevel] = 0;
						SetPlayerToTeamColor(suspect);
						SetPlayerWantedLevel(suspect, 0);
						WantLawyer[suspect] = 1;
						ClearAnimations(suspect);
						PlayerInfo[suspect][pBeingSentenced] = 60;
						SetPlayerColor(suspect, SHITTY_JUDICIALSHITHOTCH);
						SendClientMessageEx(suspect, COLOR_LIGHTBLUE, "You have been arrested for a pending warrant on you, you'll be attended by a judge soon.");
						Player_StreamPrep(suspect, WarrantJail[rand][0], WarrantJail[rand][1], WarrantJail[rand][2], FREEZE_TIME);
						
					}
				}
				else
				{
		  			SendClientMessageEx(playerid, COLOR_GREY, "   No-one close enough to arrest.");
			    	return 1;
				}
			}
			else
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "   You are not a law enforcement officer!");
		   		return 1;
			}
		}
		case 3: {

			if(IsAJudge(playerid))
			{
		 		if(!IsAtArrestPoint(playerid))
				{
		  			SendClientMessageEx(playerid, COLOR_GREY, "You aren't at the arrest point.");
			    	return 1;
				}
				new suspect = GetClosestPlayer(playerid), string[256];
				if(IsPlayerConnected(suspect))
				{
					if(ProxDetectorS(5.0, playerid,suspect))
					{
						if(PlayerInfo[suspect][pJudgeJailType] != 1) { return SendClientMessageEx(playerid, COLOR_GREY, "That person doesn't need to complete a sentence in jail."); }
						format(string, sizeof(string), "* You arrested %s!", GetPlayerNameEx(suspect));
						SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
						ResetPlayerWeaponsEx(suspect);
						for(new x; x < MAX_PLAYERVEHICLES; x++) if(PlayerVehicleInfo[suspect][x][pvTicket] >= 1) {
							PlayerVehicleInfo[suspect][x][pvTicket] = 0;
						}
						SetPlayerInterior(suspect, 5);
						SetPlayerPos(suspect,318.5971,312.9619,999.1484);
						PlayerInfo[suspect][pJailTime] = PlayerInfo[suspect][pJudgeJailTime];
						DeletePVar(suspect, "IsFrozen");
						PhoneOnline[suspect] = 1;
						PlayerInfo[suspect][pArrested] += 1;
						SetPlayerFree(suspect,playerid, "was arrested");
						PlayerInfo[suspect][pWantedLevel] = 0;
						SetPlayerToTeamColor(suspect);
						SetPlayerWantedLevel(suspect, 0);
						WantLawyer[suspect] = 1;
						TogglePlayerControllable(suspect, 1);
						ClearAnimations(suspect);
						if(PlayerCuffed[suspect] == 2)
						{
							SetHealth(suspect, GetPVarFloat(suspect, "cuffhealth"));
							SetArmour(suspect, GetPVarFloat(suspect, "cuffarmor"));
							DeletePVar(suspect, "cuffhealth");
							DeletePVar(suspect, "PlayerCuffed");
						}
						PlayerCuffed[suspect] = 0;
						DeletePVar(suspect, "PlayerCuffed");
						PlayerCuffedTime[suspect] = 0;
						PlayerInfo[suspect][pVW] = 0;
						SetPlayerVirtualWorld(suspect, 0);
					}
				}
			}
		}
	}
	return 1;
}

stock IsAtArrestPoint(playerid)
{
	if(IsPlayerConnected(playerid))
	{
		for(new x; x < MAX_ARRESTPOINTS; x++)
		{
			if(IsPlayerInDynamicArea(playerid, ArrestPoints[x][arrest_iAreaID])) return 1;
			/*
			if(ArrestPoints[x][arrestPosX] != 0)
			{
				if(ArrestPoints[x][arrestType] == type)
				{
					switch(ArrestPoints[x][arrestType])
					{
						case 0:
						{
							if(IsPlayerInRangeOfPoint(playerid, 4.0, ArrestPoints[x][arrestPosX], ArrestPoints[x][arrestPosY], ArrestPoints[x][arrestPosZ]) && GetPlayerInterior(playerid) == ArrestPoints[x][arrestInt] && GetPlayerVirtualWorld(playerid) == ArrestPoints[x][arrestVW]) return 1;
						}
						case 1:
						{
							if(IsPlayerInRangeOfPoint(playerid, 50.0, ArrestPoints[x][arrestPosX], ArrestPoints[x][arrestPosY], ArrestPoints[x][arrestPosZ]) && GetPlayerInterior(playerid) == ArrestPoints[x][arrestInt] && GetPlayerVirtualWorld(playerid) == ArrestPoints[x][arrestVW]) return 1;
						}
						case 2:
						{
							if(IsPlayerInRangeOfPoint(playerid, 10.0, ArrestPoints[x][arrestPosX], ArrestPoints[x][arrestPosY], ArrestPoints[x][arrestPosZ]) && GetPlayerInterior(playerid) == ArrestPoints[x][arrestInt] && GetPlayerVirtualWorld(playerid) == ArrestPoints[x][arrestVW]) return 1;
						}
						case 3:
						{
							if(IsPlayerInRangeOfPoint(playerid, 4.0, ArrestPoints[x][arrestPosX], ArrestPoints[x][arrestPosY], ArrestPoints[x][arrestPosZ]) && GetPlayerInterior(playerid) == ArrestPoints[x][arrestInt] && GetPlayerVirtualWorld(playerid) == ArrestPoints[x][arrestVW]) return 1;
						}
						case 4:
						{
							if(IsPlayerInRangeOfPoint(playerid, 4.0, ArrestPoints[x][arrestPosX], ArrestPoints[x][arrestPosY], ArrestPoints[x][arrestPosZ]) && GetPlayerInterior(playerid) == ArrestPoints[x][arrestInt] && GetPlayerVirtualWorld(playerid) == ArrestPoints[x][arrestVW]) return 1;
						}
					}
				}
			}
			*/
		}
	}
	return 0;
}

CMD:arrestedit(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 4)
	{
		new string[128], choice[32], id, amount;
		if(sscanf(params, "s[32]dD", choice, id, amount))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "USAGE: /arrestedit [name] [id] [amount]");
			SendClientMessageEx(playerid, COLOR_GREY, "Available names: Position, Type, jailpos1, jailpos2, Delete");
			return 1;
		}

		if(id >= MAX_ARRESTPOINTS)
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "Invalid Arrest Points ID!");
			return 1;
		}

		if(strcmp(choice, "position", true) == 0)
		{
			GetPlayerPos(playerid, ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ]);
			ArrestPoints[id][arrestInt] = GetPlayerInterior(playerid);
			ArrestPoints[id][arrestVW] = GetPlayerVirtualWorld(playerid);
			format(string, sizeof(string), "You have changed the position on Arrest Point #%d.", id);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			DestroyDynamic3DTextLabel(ArrestPoints[id][arrestTextID]);
			DestroyDynamicPickup(ArrestPoints[id][arrestPickupID]);
			switch(ArrestPoints[id][arrestType])
			{
				case 0:
				{
					format(szMiscArray, sizeof(szMiscArray), "Press Y to arrest\nArrest Point #%d", id);
					ArrestPoints[id][arrestTextID] = CreateDynamic3DTextLabel(szMiscArray, COLOR_DBLUE, ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ]+0.6, 4.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, ArrestPoints[id][arrestVW], ArrestPoints[id][arrestInt], -1);
					ArrestPoints[id][arrestPickupID] = CreateDynamicPickup(1247, 23, ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ], ArrestPoints[id][arrestVW]);
					ArrestPoints[id][arrest_iAreaID] = CreateDynamicSphere(ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ], 4.0, ArrestPoints[id][arrestVW]);
				}
				case 2:
				{
					format(szMiscArray, sizeof(szMiscArray), "Press Y to arrest\nArrest Point #%d", id);
					ArrestPoints[id][arrestTextID] = CreateDynamic3DTextLabel(szMiscArray, COLOR_DBLUE, ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ]+0.6, 4.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, ArrestPoints[id][arrestVW], ArrestPoints[id][arrestInt], -1);
					ArrestPoints[id][arrestPickupID] = CreateDynamicPickup(1247, 23, ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ], ArrestPoints[id][arrestVW]);
					ArrestPoints[id][arrest_iAreaID] = CreateDynamicSphere(ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ], 50.0, ArrestPoints[id][arrestVW]);
				}
				case 3:
				{
					format(szMiscArray, sizeof(szMiscArray), "Press Y to arrest\nArrest Point #%d", id);
					ArrestPoints[id][arrestTextID] = CreateDynamic3DTextLabel(szMiscArray, COLOR_DBLUE, ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ]+0.6, 4.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, ArrestPoints[id][arrestVW], ArrestPoints[id][arrestInt], -1);
					ArrestPoints[id][arrestPickupID] = CreateDynamicPickup(1247, 23, ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ], ArrestPoints[id][arrestVW]);
					ArrestPoints[id][arrest_iAreaID] = CreateDynamicSphere(ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ], 10.0, ArrestPoints[id][arrestVW]);
					ArrestPoints[id][arrest_iAreaID] = CreateDynamicSphere(ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ], 4.0, ArrestPoints[id][arrestVW]);
				}
				case 4:
				{
					format(szMiscArray, sizeof(szMiscArray), "Press Y to arrest\nArrest Point #%d", id);
					ArrestPoints[id][arrestTextID] = CreateDynamic3DTextLabel(szMiscArray, COLOR_DBLUE, ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ]+0.6, 4.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, ArrestPoints[id][arrestVW], ArrestPoints[id][arrestInt], -1);
					ArrestPoints[id][arrestPickupID] = CreateDynamicPickup(1247, 23, ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ], ArrestPoints[id][arrestVW]);
					ArrestPoints[id][arrest_iAreaID] = CreateDynamicSphere(ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ], 4.0, ArrestPoints[id][arrestVW]);
				}
			}
			SaveArrestPoint(id);
			format(string, sizeof(string), "%s has edited Arrest Point ID %d's position.", GetPlayerNameEx(playerid), id);
			Log("logs/arrestedit.log", string);
			return 1;
		}
		else if(strcmp(choice, "type", true) == 0)
		{
			if(ArrestPoints[id][arrestPosX] == 0)
			{
				format(string, sizeof(string), "Arrest Point #%d does not exist.", id);
				SendClientMessageEx(playerid, COLOR_WHITE, string);
				return 1;
			}
			ArrestPoints[id][arrestType] = amount;
			format(string, sizeof(string), "You have changed the type for Arrest Point #%d to %d.", id, amount);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			DestroyDynamic3DTextLabel(ArrestPoints[id][arrestTextID]);
			DestroyDynamicPickup(ArrestPoints[id][arrestPickupID]);
			switch(ArrestPoints[id][arrestType])
			{
				case 0:
				{
					format(szMiscArray, sizeof(szMiscArray), "Press Y to arrest\nArrest Point #%d", id);
					ArrestPoints[id][arrestTextID] = CreateDynamic3DTextLabel(szMiscArray, COLOR_DBLUE, ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ]+0.6, 4.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, ArrestPoints[id][arrestVW], ArrestPoints[id][arrestInt], -1);
					ArrestPoints[id][arrestPickupID] = CreateDynamicPickup(1247, 23, ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ], ArrestPoints[id][arrestVW]);
					ArrestPoints[id][arrest_iAreaID] = CreateDynamicSphere(ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ], 4.0, ArrestPoints[id][arrestVW]);
				}
				case 2:
				{
					format(szMiscArray, sizeof(szMiscArray), "Press Y to arrest\nArrest Point #%d", id);
					ArrestPoints[id][arrestTextID] = CreateDynamic3DTextLabel(szMiscArray, COLOR_DBLUE, ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ]+0.6, 4.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, ArrestPoints[id][arrestVW], ArrestPoints[id][arrestInt], -1);
					ArrestPoints[id][arrestPickupID] = CreateDynamicPickup(1247, 23, ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ], ArrestPoints[id][arrestVW]);
					ArrestPoints[id][arrest_iAreaID] = CreateDynamicSphere(ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ], 50.0, ArrestPoints[id][arrestVW]);
				}
				case 3:
				{
					format(szMiscArray, sizeof(szMiscArray), "Press Y to arrest\nArrest Point #%d", id);
					ArrestPoints[id][arrestTextID] = CreateDynamic3DTextLabel(szMiscArray, COLOR_DBLUE, ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ]+0.6, 4.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, ArrestPoints[id][arrestVW], ArrestPoints[id][arrestInt], -1);
					ArrestPoints[id][arrestPickupID] = CreateDynamicPickup(1247, 23, ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ], ArrestPoints[id][arrestVW]);
					ArrestPoints[id][arrest_iAreaID] = CreateDynamicSphere(ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ], 10.0, ArrestPoints[id][arrestVW]);
					ArrestPoints[id][arrest_iAreaID] = CreateDynamicSphere(ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ], 4.0, ArrestPoints[id][arrestVW]);
				}
				case 4:
				{
					format(szMiscArray, sizeof(szMiscArray), "Press Y to arrest\nArrest Point #%d", id);
					ArrestPoints[id][arrestTextID] = CreateDynamic3DTextLabel(szMiscArray, COLOR_DBLUE, ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ]+0.6, 4.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, ArrestPoints[id][arrestVW], ArrestPoints[id][arrestInt], -1);
					ArrestPoints[id][arrestPickupID] = CreateDynamicPickup(1247, 23, ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ], ArrestPoints[id][arrestVW]);
					ArrestPoints[id][arrest_iAreaID] = CreateDynamicSphere(ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ], 4.0, ArrestPoints[id][arrestVW]);
				}
			}
			SaveArrestPoint(id);
			format(string, sizeof(string), "%s has changed the type on Arrest Point ID %d to %d.", GetPlayerNameEx(playerid), id, amount);
			Log("logs/arrestedit.log", string);
			return 1;
		}
		else if(strcmp(choice, "jailpos1", true) == 0) 
		{
			if(ArrestPoints[id][arrestPosX] == 0)
			{
				format(string, sizeof(string), "Arrest Point #%d does not exist.", id);
				SendClientMessageEx(playerid, COLOR_WHITE, string);
				return 1;
			}
			GetPlayerPos(playerid, ArrestPoints[id][JailPos1][0], ArrestPoints[id][JailPos1][1], ArrestPoints[id][JailPos1][2]);
			ArrestPoints[id][jailVW] = GetPlayerVirtualWorld(playerid);
			ArrestPoints[id][jailInt] = GetPlayerInterior(playerid);
			format(string, sizeof(string), "You have changed the jail cell position 1 on Arrest Point #%d.", id);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SaveArrestPoint(id);
			format(string, sizeof(string), "%s has changed the jail cell position 1 on Arrest Point ID %d.", GetPlayerNameEx(playerid), id);
			Log("logs/arrestedit.log", string);
		}
		else if(strcmp(choice, "jailpos2", true) == 0) 
		{
			if(ArrestPoints[id][arrestPosX] == 0)
			{
				format(string, sizeof(string), "Arrest Point #%d does not exist.", id);
				SendClientMessageEx(playerid, COLOR_WHITE, string);
				return 1;
			}
			GetPlayerPos(playerid, ArrestPoints[id][JailPos2][0], ArrestPoints[id][JailPos2][1], ArrestPoints[id][JailPos2][2]);
			ArrestPoints[id][jailVW] = GetPlayerVirtualWorld(playerid);
			ArrestPoints[id][jailInt] = GetPlayerInterior(playerid);
			format(string, sizeof(string), "You have changed the jail cell position 2 on Arrest Point #%d.", id);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SaveArrestPoint(id);
			format(string, sizeof(string), "%s has changed the jail cell position 2 on Arrest Point ID %d.", GetPlayerNameEx(playerid), id);
			Log("logs/arrestedit.log", string);
		}
		else if(strcmp(choice, "delete", true) == 0)
		{
			if(ArrestPoints[id][arrestPosX] == 0)
			{
				format(string, sizeof(string), "Arrest Point #%d does not exist.", id);
				SendClientMessageEx(playerid, COLOR_WHITE, string);
				return 1;
			}
			DestroyDynamic3DTextLabel(ArrestPoints[id][arrestTextID]);
			DestroyDynamicPickup(ArrestPoints[id][arrestPickupID]);
			ArrestPoints[id][arrestPosX] = 0.0;
			ArrestPoints[id][arrestPosY] = 0.0;
			ArrestPoints[id][arrestPosZ] = 0.0;
			ArrestPoints[id][arrestVW] = 0;
			ArrestPoints[id][arrestInt] = 0;
			ArrestPoints[id][arrestType] = 0;
			SaveArrestPoint(id);
			format(string, sizeof(string), "You have deleted Arrest Point #%d.", id);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			format(string, sizeof(string), "%s has deleted Arrest Point ID %d.", GetPlayerNameEx(playerid), id);
			Log("logs/arrestedit.log", string);
			return 1;
		}
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "You are not authorized to use that command.");
	return 1;
}

CMD:arreststatus(playerid, params[])
{
	new id;
	if(sscanf(params, "i", id))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "USAGE: /arreststatus [id]");
		return 1;
	}
	if (PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pFactionModerator] >= 1)
	{
		new string[128];
		format(string,sizeof(string),"|___________ Arrest Point Status (ID: %d) ___________|", id);
		SendClientMessageEx(playerid, COLOR_GREEN, string);
		format(string, sizeof(string), "[Position] X: %f | Y: %f | Z: %f | VW: %d | Int: %d | Type: %d", ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ], ArrestPoints[id][arrestVW], ArrestPoints[id][arrestInt], ArrestPoints[id][arrestType]);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
		format(string, sizeof(string), "[JailPos 1] X: %f | Y: %f | Z: %f | VW: %d | Int: %d", ArrestPoints[id][JailPos1][0], ArrestPoints[id][JailPos1][1], ArrestPoints[id][JailPos1][2], ArrestPoints[id][jailVW], ArrestPoints[id][jailInt]);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
		format(string, sizeof(string), "[JailPos 2] X: %f | Y: %f | Z: %f", ArrestPoints[id][JailPos2][0], ArrestPoints[id][JailPos2][1], ArrestPoints[id][JailPos2][2]);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "You are not authorized to use that command.");
	}
	return 1;
}

CMD:arrestnext(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 4)
	{
		SendClientMessageEx(playerid, COLOR_RED, "* Listing next available Arrest Point...");
		for(new x = 0; x < MAX_ARRESTPOINTS; x++)
		{
			if(ArrestPoints[x][arrestPosX] == 0)
		    {
		        new string[128];
		        format(string, sizeof(string), "%d is available to use.", x);
		        SendClientMessageEx(playerid, COLOR_WHITE, string);
		        break;
			}
		}
	}
	else
	{
	    SendClientMessageEx(playerid, COLOR_GRAD2, "You are not authorized to use that command.");
		return 1;
	}
	return 1;
}

CMD:gotoarrestpoint(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pFactionModerator] >= 1)
	{
		new id;
		if(sscanf(params, "d", id)) return SendClientMessageEx(playerid, COLOR_GREY, "USAGE: /gotoarrestpoint [id]");

		SetPlayerPos(playerid, ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ]);
		SetPlayerInterior(playerid, ArrestPoints[id][arrestInt]);
		PlayerInfo[playerid][pInt] = ArrestPoints[id][arrestInt];
		SetPlayerVirtualWorld(playerid, ArrestPoints[id][arrestVW]);
		PlayerInfo[playerid][pVW] = ArrestPoints[id][arrestVW];
	}
	return 1;
}
