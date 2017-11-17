	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text




	thumb_func_start sub_80B5734
sub_80B5734: @ 80B5734
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl CheckFeebas
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080B5764
	ldr r4, =gUnknown_08553A78
	adds r0, r4, 0
	bl ChooseWildMonLevel
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldrh r4, [r4, 0x2]
	adds r0, r4, 0
	bl CreateWildMon
	b _080B5784
	.pool
_080B5764:
	ldr r4, =gWildMonHeaders
	bl GetCurrentMapWildMonHeaderId
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 2
	adds r4, 0x10
	adds r1, r4
	ldr r0, [r1]
	adds r1, r5, 0
	bl GenerateFishingWildMon
	lsls r0, 16
	lsrs r4, r0, 16
_080B5784:
	movs r0, 0xC
	bl IncrementGameStat
	adds r0, r4, 0
	bl sub_80EDA3C
	bl BattleSetup_StartWildBattle
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80B5734

	thumb_func_start wild_pokemon_rand_for_map
wild_pokemon_rand_for_map: @ 80B57A0
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r0, 0
	strb r0, [r6]
	bl GetCurrentMapWildMonHeaderId
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r0, =0x0000ffff
	cmp r3, r0
	beq _080B57D2
	ldr r2, =gWildMonHeaders
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 2
	adds r0, r2, 0x4
	adds r0, r1, r0
	ldr r5, [r0]
	adds r2, 0x8
	adds r1, r2
	ldr r4, [r1]
	cmp r5, 0
	bne _080B57E0
	cmp r4, 0
	bne _080B57E6
_080B57D2:
	movs r0, 0
	b _080B5826
	.pool
_080B57E0:
	cmp r4, 0
	bne _080B57F4
	b _080B5818
_080B57E6:
	movs r0, 0x1
	strb r0, [r6]
	bl ChooseWildMonIndex_WaterRock
	lsls r0, 24
	ldr r1, [r4, 0x4]
	b _080B5820
_080B57F4:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x4F
	bls _080B5818
	movs r0, 0x1
	strb r0, [r6]
	bl ChooseWildMonIndex_WaterRock
	lsls r0, 24
	ldr r1, [r4, 0x4]
	b _080B5820
_080B5818:
	bl ChooseWildMonIndex_Land
	lsls r0, 24
	ldr r1, [r5, 0x4]
_080B5820:
	lsrs r0, 22
	adds r0, r1
	ldrh r0, [r0, 0x2]
_080B5826:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end wild_pokemon_rand_for_map

	thumb_func_start sub_80B582C
sub_80B582C: @ 80B582C
	push {r4,lr}
	bl GetCurrentMapWildMonHeaderId
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, =0x0000ffff
	cmp r2, r0
	beq _080B5868
	ldr r1, =gWildMonHeaders
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 2
	adds r1, 0x8
	adds r0, r1
	ldr r4, [r0]
	cmp r4, 0
	beq _080B5868
	bl ChooseWildMonIndex_WaterRock
	lsls r0, 24
	ldr r1, [r4, 0x4]
	lsrs r0, 22
	adds r0, r1
	ldrh r0, [r0, 0x2]
	b _080B586A
	.pool
_080B5868:
	movs r0, 0
_080B586A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80B582C

	thumb_func_start sub_80B5870
sub_80B5870: @ 80B5870
	push {r4,r5,lr}
	bl InBattlePike
	lsls r0, 24
	cmp r0, 0
	bne _080B58C4
	bl InBattlePyramid
	lsls r0, 24
	cmp r0, 0
	bne _080B58C4
	bl InUnionRoom
	cmp r0, 0x1
	beq _080B58C4
	ldr r5, =0x00004021
	adds r0, r5, 0
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	beq _080B58C4
	subs r4, r0, 0x1
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl VarSet
	cmp r4, 0
	bne _080B58C4
	ldr r0, =EventScript_RepelWoreOff
	bl ScriptContext1_SetupScript
	movs r0, 0x1
	b _080B58C6
	.pool
_080B58C4:
	movs r0, 0
_080B58C6:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80B5870

	thumb_func_start IsWildLevelAllowedByRepel
IsWildLevelAllowedByRepel: @ 80B58CC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, =0x00004021
	bl VarGet
	lsls r0, 16
	cmp r0, 0
	beq _080B5912
	movs r5, 0
_080B58E0:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _080B5920
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _080B5920
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	bcc _080B592A
_080B5912:
	movs r0, 0x1
	b _080B592C
	.pool
_080B5920:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _080B58E0
_080B592A:
	movs r0, 0
_080B592C:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end IsWildLevelAllowedByRepel

	thumb_func_start IsAbilityAllowingEncounter
@ _BOOL1 IsAbilityAllowingEncounter(u8 wildMonLevel)
IsAbilityAllowingEncounter: @ 80B5934
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, =gPlayerParty
	adds r0, r4, 0
	movs r1, 0x6
	bl GetMonData
	cmp r0, 0
	bne _080B5988
	adds r0, r4, 0
	bl GetMonAbility
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x33
	beq _080B595A
	cmp r0, 0x16
	bne _080B5988
_080B595A:
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bls _080B5988
	subs r0, 0x5
	cmp r5, r0
	bgt _080B5988
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080B5988
	movs r0, 0
	b _080B598A
	.pool
_080B5988:
	movs r0, 0x1
_080B598A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end IsAbilityAllowingEncounter

	thumb_func_start TryGetRandomWildMonIndexByType
@ _BOOL1 TryGetRandomWildMonIndexByType(WildMonEntry *mons, u8 type, u8 numMons, u8 *monIndex)
TryGetRandomWildMonIndexByType: @ 80B5990
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r7, sp
	mov r12, r0
	mov r8, r3
	lsls r1, 24
	lsrs r1, 24
	str r1, [r7]
	lsls r2, 24
	lsrs r2, 24
	mov r9, sp
	adds r0, r2, 0x3
	lsrs r0, 2
	lsls r0, 2
	mov r1, sp
	subs r1, r0
	mov sp, r1
	mov r5, sp
	movs r3, 0
	cmp r3, r2
	bcs _080B59D2
	movs r1, 0
_080B59C4:
	adds r0, r5, r3
	strb r1, [r0]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, r2
	bcc _080B59C4
_080B59D2:
	movs r4, 0
	movs r3, 0
	cmp r4, r2
	bcs _080B5A12
	ldr r6, =gBaseStats
	mov r10, r6
_080B59DE:
	lsls r0, r3, 2
	add r0, r12
	ldrh r1, [r0, 0x2]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	mov r6, r10
	adds r1, r0, r6
	ldrb r0, [r1, 0x6]
	ldr r6, [r7]
	cmp r0, r6
	beq _080B59FC
	ldrb r0, [r1, 0x7]
	cmp r0, r6
	bne _080B5A08
_080B59FC:
	adds r1, r4, 0
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r1, r5, r1
	strb r3, [r1]
_080B5A08:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, r2
	bcc _080B59DE
_080B5A12:
	cmp r4, 0
	beq _080B5A1A
	cmp r4, r2
	bne _080B5A24
_080B5A1A:
	movs r0, 0
	b _080B5A3C
	.pool
_080B5A24:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r1, r4, 0
	bl __modsi3
	adds r0, r5, r0
	ldrb r0, [r0]
	mov r1, r8
	strb r0, [r1]
	movs r0, 0x1
_080B5A3C:
	mov sp, r9
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end TryGetRandomWildMonIndexByType

	thumb_func_start TryGetAbilityInfluencedWildMonIndex
@ _BOOL1 TryGetAbilityInfluencedWildMonIndex(WildMonEntry *mons, u8 type, u8 abilityId, u8 *monIndex)
TryGetAbilityInfluencedWildMonIndex: @ 80B5A50
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	mov r8, r3
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	ldr r4, =gPlayerParty
	adds r0, r4, 0
	movs r1, 0x6
	bl GetMonData
	cmp r0, 0
	bne _080B5AA4
	adds r0, r4, 0
	bl GetMonAbility
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r5
	bne _080B5AA4
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080B5AA4
	adds r0, r7, 0
	adds r1, r6, 0
	movs r2, 0xC
	mov r3, r8
	bl TryGetRandomWildMonIndexByType
	lsls r0, 24
	lsrs r0, 24
	b _080B5AA6
	.pool
_080B5AA4:
	movs r0, 0
_080B5AA6:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end TryGetAbilityInfluencedWildMonIndex

	thumb_func_start ApplyFluteEncounterRateMod
@ void ApplyFluteEncounterRateMod(u32 *val)
ApplyFluteEncounterRateMod: @ 80B5AB0
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, =0x000008ad
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080B5AD0
	ldr r0, [r4]
	lsrs r1, r0, 1
	adds r0, r1
	b _080B5AE2
	.pool
_080B5AD0:
	ldr r0, =0x000008ae
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080B5AE4
	ldr r0, [r4]
	lsrs r0, 1
_080B5AE2:
	str r0, [r4]
_080B5AE4:
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end ApplyFluteEncounterRateMod

	thumb_func_start ApplyCleanseTagEncounterRateMod
ApplyCleanseTagEncounterRateMod: @ 80B5AF0
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, =gPlayerParty
	movs r1, 0xC
	bl GetMonData
	cmp r0, 0xBE
	bne _080B5B0C
	ldr r0, [r4]
	lsls r0, 1
	movs r1, 0x3
	bl __udivsi3
	str r0, [r4]
_080B5B0C:
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end ApplyCleanseTagEncounterRateMod

	.align 2, 0 @ Don't pad with nop.
