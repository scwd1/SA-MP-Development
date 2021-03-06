/* Discord Connector
 * Version 0.1
 * made by maddinat0r
 */


#if defined dcconnector_included
	#endinput
#endif
#define dcconnector_included



#if !defined E_LOGLEVEL
enum E_LOGLEVEL
{
	NONE = 0,
	DEBUG = 1,
	INFO = 2,
	WARNING = 4,
	ERROR = 8,
	
	ALL = ERROR | WARNING | INFO | DEBUG
};
#endif



// natives
native DCC_Connect(const bot_token[]);

native DCC_Channel:DCC_FindChannelByName(const channel_name[]);
native DCC_Channel:DCC_FindChannelById(const channel_id[]);

native DCC_IsChannelPrivate(DCC_Channel:channel, &bool:is_private);
native DCC_GetChannelName(DCC_Channel:channel, dest[], max_size = sizeof dest);
native DCC_GetChannelId(DCC_Channel:channel, dest[], max_size = sizeof dest);
native DCC_GetChannelTopic(DCC_Channel:channel, dest[], max_size = sizeof dest);

native DCC_SendChannelMessage(DCC_Channel:channel, const message[]);


// callbacks
forward DCC_OnChannelMessage(DCC_Channel:channel, const author[], const message[]);
