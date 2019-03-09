#include <sourcemod>

public void OnPluginStart() {
	HookEvent("round_start", EventRoundStart, EventHookMode_Post);
}

public Action EventRoundStart(Event ev, const char[] sEvName, bool bDontBroadcast) {
	int iMaxEntities = GetMaxEntities();
	char sClassname[32];
	for (int i = MaxClients + 1; i < iMaxEntities; i++) {
		if (IsValidEdict(i)) {
			GetEdictClassname(i, sClassname, sizeof(sClassname));
			if (((StrContains(sClassname, "weapon_awp") != -1) || (StrContains(sClassname, "weapon_deagle") != -1) || (StrContains(sClassname, "weapon_knife") != -1) || (StrContains(sClassname, "item_") != -1)) && GetEntPropEnt(i, Prop_Data, "m_hOwnerEntity") == -1) {
				RemoveEdict(i);
			} else if (StrContains(sClassname, "func_bomb_target_hostage_entity_func_hostage_rescue") != -1) {
				RemoveEdict(i);
			}
		}
	}
}