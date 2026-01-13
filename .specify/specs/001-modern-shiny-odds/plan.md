# Technical Implementation Plan: Modern Shiny Pokemon Odds

**Feature Branch**: `001-modern-shiny-odds`  
**Created**: January 12, 2026  
**Technology Stack**: Game Boy Assembly (RGBDS), Game Boy Color Hardware

## Architecture Overview

### Current Implementation (Gen II)

**Shiny Determination Method**: DVs (Deterministic Values) pattern matching

A Pokemon is shiny when ALL of the following DV conditions are met:
- Attack DV: Must have bit pattern %0010 in the high nibble (bits 4-7)
- Defense DV: Must equal 10
- Speed DV: Must equal 10
- Special DV: Must equal 10

**Current Odds**: 1 in 8192 (2^13)

**Key Files**:
- `engine/gfx/color.asm`: Contains `CheckShininess` function that validates DV patterns
- `engine/battle/core.asm`: Contains `LoadEnemyMon` for wild Pokemon DV generation
- `engine/pokemon/move_mon.asm`: Contains `GeneratePartyMonStats` for general Pokemon initialization
- `engine/events/daycare.asm`: Contains egg DV generation logic
- `constants/battle_constants.asm`: Defines `ATKDEFDV_SHINY` ($EA) and `SPDSPCDV_SHINY` ($AA)

### Target Implementation (Modern)

**Shiny Determination Method**: Modified DVs pattern matching with relaxed constraints

To achieve 1 in 4096 odds (2^12), we need to allow twice as many DV combinations to be considered shiny.

**Target Odds**: 1 in 4096 (2^12)

**Implementation Strategy**: Modify `CheckShininess` to accept 2x more DV patterns

## Technical Approach

### Option 1: Relax One Constraint (SELECTED)

Remove one bit of constraint from the shiny check to double the acceptance rate from 1/8192 to 1/4096.

**Modification**: Remove the Attack DV bit pattern requirement
- Keep: Defense DV = 10, Speed DV = 10, Special DV = 10
- Remove: Attack DV bit pattern %0010 check
- New odds: 1 in 4096 (exactly 2^12)

**Advantages**:
- Minimal code change (remove ~3 lines from CheckShininess)
- Maintains compatibility with existing shiny Pokemon (all old shinies remain shiny)
- Clean mathematical progression (2^13 → 2^12)
- No performance impact

### Option 2: Two-Value Check (Alternative, Not Chosen)

Allow DVs to be either 10 OR 11 to double the possibilities.

**Not selected because**: More complex code changes, requires modifying multiple checks

## File Modifications

### 1. `engine/gfx/color.asm`

**Function**: `CheckShininess`  
**Current Logic**: Checks all 4 DV constraints (Attack pattern, Def=10, Spd=10, Spc=10)  
**New Logic**: Check only 3 DV constraints (Def=10, Spd=10, Spc=10)

**Change**: Remove the Attack DV bit pattern check (lines 14-16)

```gbz80
; OLD CODE (remove):
	ld a, [hl]
	and SHINY_ATK_MASK << 4
	jr z, .not_shiny

; NEW CODE (simplified):
; (Just remove the above 3 lines - Defense check comes next automatically)
```

### 2. `constants/battle_constants.asm`

**Current**: Defines specific shiny DV values for forced shiny battles  
**Change**: Update comments to reflect new odds

```gbz80
; OLD:
; shiny dvs
DEF ATKDEFDV_SHINY EQU $EA
DEF SPDSPCDV_SHINY EQU $AA

; NEW:
; shiny dvs (1 in 4096 modern odds)
; These values are used for BATTLETYPE_FORCESHINY (Red Gyarados)
DEF ATKDEFDV_SHINY EQU $EA
DEF SPDSPCDV_SHINY EQU $AA
```

### 3. `engine/battle/core.asm`

**Function**: `LoadEnemyMon.GenerateDVs`  
**Current**: Generates random DVs for wild Pokemon  
**Change**: Add comment explaining modern shiny odds

**No code change needed** - DVs are still randomly generated the same way. The shiny check modification in `CheckShininess` handles the odds change.

### 4. `engine/events/daycare.asm`

**Current**: Generates egg DVs using Random calls  
**Change**: Add comment explaining modern shiny odds apply to eggs

**No code change needed** - Egg DVs inherit from parents or are randomly generated. The shiny check modification applies automatically.

### 5. `engine/pokemon/move_mon.asm`

**Function**: `GeneratePartyMonStats.initializeDVs`  
**Current**: Generates DVs for new party Pokemon  
**Change**: Add comment explaining modern shiny odds

**No code change needed** - DVs are randomly generated. The shiny check modification applies automatically.

## Testing Strategy

### Unit Testing

1. **Shiny Check Validation**:
   - Test that Pokemon with Def=10, Spd=10, Spc=10 are shiny regardless of Attack DV
   - Test that Pokemon with any other DV combination are not shiny
   - Verify 16 different Attack DV values (0-15) all produce shiny with Def/Spd/Spc=10

2. **Forced Shiny**:
   - Verify Red Gyarados battle still produces shiny Pokemon
   - Confirm BATTLETYPE_FORCESHINY still works

3. **DV Generation**:
   - Generate 10,000+ wild Pokemon and verify approximately 2.44 are shiny (1/4096 rate)
   - Statistical validation with confidence intervals

### Integration Testing

1. **Wild Encounters**: Test shiny appearance in grass, caves, fishing, surfing
2. **Breeding**: Test that bred eggs can be shiny at the new rate
3. **Static Encounters**: Test starter Pokemon, legendaries, gift Pokemon
4. **Save Compatibility**: Load existing saves and verify existing shiny Pokemon remain shiny

### Acceptance Criteria

- ✅ Shiny encounter rate is statistically 1 in 4096 (measured over 10,000+ encounters)
- ✅ All existing shiny Pokemon remain shiny (backward compatibility)
- ✅ Red Gyarados forced shiny battle works
- ✅ Breeding produces shiny eggs at the new rate
- ✅ No performance degradation in encounter generation
- ✅ Code change is minimal (less than 10 lines modified)

## Build and Deployment

### Build Process

```bash
# Build the ROM
make

# Optional: Compare ROM size and verify no unexpected changes
make compare
```

### Testing Process

```bash
# Run any existing test suites
make test

# Manual testing with emulator
# Load ROM in BGB or other Game Boy Color emulator
# Test wild encounters, breeding, static encounters
```

## Rollback Plan

If issues arise, revert changes to `engine/gfx/color.asm` to restore original 1 in 8192 odds.

## Documentation Updates

### Code Comments

- Add comments explaining the modern odds calculation
- Document why the Attack DV check was removed
- Add statistical validation notes

### User-Facing Documentation

- Update README.md to mention modern shiny odds as a feature
- Document that existing shiny Pokemon are unaffected

## Risks and Mitigations

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| Existing shiny Pokemon become non-shiny | Low | High | Verify CheckShininess logic maintains backward compatibility |
| Shiny rate is incorrect | Medium | Medium | Statistical testing with 10,000+ encounters |
| Performance regression | Very Low | Low | DV generation unchanged, only check simplified |
| Save file corruption | Very Low | Critical | No save data structures modified |

## Dependencies

- RGBDS assembler (already in build toolchain)
- Game Boy Color emulator for testing (BGB recommended)
- Statistical analysis tools for validation

## Success Metrics

1. **Correctness**: Shiny rate measured at 1 in 4096 (±2% variance)
2. **Compatibility**: All existing shiny Pokemon remain shiny
3. **Performance**: No measurable slowdown in encounter generation
4. **Code Quality**: Less than 10 lines of code changed
5. **Maintainability**: Clear comments explain the modification
