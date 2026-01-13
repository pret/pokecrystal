# Implementation Tasks: Modern Shiny Pokemon Odds

**Feature**: 001-modern-shiny-odds  
**Created**: January 12, 2026  
**Estimated Duration**: 1-2 hours

## Task Execution Order

Tasks are organized into phases. Complete each phase before moving to the next.

**Legend**:
- [P] = Can be executed in parallel with other [P] tasks in the same phase
- Sequential tasks must be completed in order

---

## Phase 1: Setup and Preparation

### Task 1.1: Verify Build Environment
**Status**: Not Started  
**Files**: `Makefile`, build toolchain  
**Description**: Verify the project builds successfully before making changes  
**Actions**:
1. Run `make clean`
2. Run `make` to build the ROM
3. Verify build completes without errors
4. Note the ROM checksum for comparison

**Success Criteria**:
- Build completes successfully
- ROM file generated

---

### Task 1.2: Create Backup Branch [P]
**Status**: Not Started  
**Description**: Create a backup point before making changes  
**Actions**:
1. Commit any uncommitted changes
2. Note current commit hash for reference

**Success Criteria**:
- All changes committed
- Current state saved

---

## Phase 2: Core Implementation

### Task 2.1: Modify CheckShininess Function
**Status**: Not Started  
**Files**: `engine/gfx/color.asm`  
**Description**: Remove the Attack DV bit pattern check to double shiny odds  
**Actions**:
1. Open `engine/gfx/color.asm`
2. Locate `CheckShininess` function (around line 8)
3. Remove lines 14-16 (Attack DV check):
   ```gbz80
   ; DELETE THESE LINES:
   ld a, [hl]
   and SHINY_ATK_MASK << 4
   jr z, .not_shiny
   ```
4. Add comment explaining the change:
   ```gbz80
   ; Modern shiny odds (1 in 4096) - Attack DV check removed
   ; to allow 16x more DV combinations
   ```

**Success Criteria**:
- Attack DV check removed
- Code compiles without errors
- Comment explains the modification

---

### Task 2.2: Update Shiny DV Constants Documentation [P]
**Status**: Not Started  
**Files**: `constants/battle_constants.asm`  
**Description**: Update comments to reflect new shiny odds  
**Actions**:
1. Open `constants/battle_constants.asm`
2. Locate shiny DV constants (around line 80-82)
3. Update comment to explain modern odds:
   ```gbz80
   ; Shiny DVs (1 in 4096 modern odds)
   ; Used for BATTLETYPE_FORCESHINY (Red Gyarados at Lake of Rage)
   ; With modern shiny check, any Attack DV works (Def=10, Spd=10, Spc=10)
   DEF ATKDEFDV_SHINY EQU $EA
   DEF SPDSPCDV_SHINY EQU $AA
   ```

**Success Criteria**:
- Comments updated
- Constants unchanged (maintain forced shiny compatibility)

---

### Task 2.3: Add Documentation Comments [P]
**Status**: Not Started  
**Files**:
- `engine/battle/core.asm` (LoadEnemyMon function)
- `engine/events/daycare.asm` (egg DV generation)
- `engine/pokemon/move_mon.asm` (GeneratePartyMonStats function)

**Description**: Add comments explaining that modern shiny odds apply  
**Actions**:
1. In `engine/battle/core.asm` at `.GenerateDVs` (line ~6117):
   ```gbz80
   .GenerateDVs:
   ; Generate new random DVs
   ; Modern shiny odds: 1 in 4096 (Def=10, Spd=10, Spc=10, any Attack)
   ```

2. In `engine/events/daycare.asm` at egg DV generation (line ~644):
   ```gbz80
   ld hl, wEggMonDVs
   ; Generate random DVs for egg (modern shiny odds: 1/4096)
   call Random
   ```

3. In `engine/pokemon/move_mon.asm` at `.initializeDVs` (line ~206):
   ```gbz80
   .initializeDVs:
   ; Modern shiny odds: 1 in 4096
   ld a, b
   ```

**Success Criteria**:
- Comments added to all three files
- No functional code changes

---

## Phase 3: Build and Validation

### Task 3.1: Rebuild ROM
**Status**: Not Started  
**Files**: All modified files  
**Description**: Rebuild the ROM with changes  
**Actions**:
1. Run `make clean`
2. Run `make`
3. Verify no compilation errors
4. Verify ROM file generated successfully

**Success Criteria**:
- Build completes without errors
- ROM file created
- File size comparable to original

---

### Task 3.2: Verify Forced Shiny Still Works [P]
**Status**: Not Started  
**Files**: Test in emulator  
**Description**: Verify Red Gyarados forced shiny battle produces shiny  
**Actions**:
1. Load ROM in emulator
2. Use cheats/save editor to reach Lake of Rage
3. Encounter Red Gyarados
4. Verify it appears shiny (different color palette)

**Success Criteria**:
- Red Gyarados is shiny
- Battle initiates correctly

---

### Task 3.3: Code Review [P]
**Status**: Not Started  
**Description**: Review all changes for correctness  
**Actions**:
1. Review the diff: `git diff`
2. Verify only intended lines were changed
3. Check that no unintended changes were made
4. Verify comments are clear and accurate

**Success Criteria**:
- All changes reviewed
- No unintended modifications
- Code follows project style guide (STYLE.md)

---

## Phase 4: Testing

### Task 4.1: Manual Shiny Encounter Testing
**Status**: Not Started  
**Description**: Test that wild Pokemon can be shiny  
**Actions**:
1. Load ROM in emulator with save states
2. Encounter wild Pokemon repeatedly
3. Use save states to test multiple encounters quickly
4. Verify shiny Pokemon appear (sparkle animation, different colors)
5. Document approximate encounter rate

**Success Criteria**:
- At least one shiny Pokemon encountered in reasonable time
- Shiny Pokemon display correctly

---

### Task 4.2: Statistical Validation (Optional)
**Status**: Not Started  
**Description**: Generate large sample of Pokemon to validate 1/4096 rate  
**Actions**:
1. Create test script or use debugger to generate Pokemon
2. Generate 10,000+ Pokemon with random DVs
3. Count how many are shiny using CheckShininess
4. Calculate actual rate and compare to expected 1/4096

**Success Criteria**:
- Sample size >= 10,000
- Shiny rate within 1.5-3.0 per 4096 (statistical variance expected)

---

### Task 4.3: Backward Compatibility Test
**Status**: Not Started  
**Description**: Verify existing shiny Pokemon remain shiny  
**Actions**:
1. Test with Pokemon having DVs: Attack=any, Def=10, Spd=10, Spc=10
2. Verify they are detected as shiny
3. Test forced shiny DVs ($EA, $AA) still work
4. Test old shiny DVs (Attack=%0010, Def=10, Spd=10, Spc=10) still work

**Success Criteria**:
- All old shiny combinations still detected as shiny
- New shiny combinations also detected

---

## Phase 5: Documentation and Finalization

### Task 5.1: Update README [P]
**Status**: Not Started  
**Files**: `README.md`  
**Description**: Document modern shiny odds feature  
**Actions**:
1. Add to features list (if exists)
2. Mention modern shiny odds (1 in 4096)
3. Note backward compatibility

**Success Criteria**:
- README updated with feature description
- Clear user-facing documentation

---

### Task 5.2: Create FAQ Entry [P]
**Status**: Not Started  
**Files**: `FAQ.md` (if exists)  
**Description**: Add FAQ entry about shiny odds  
**Actions**:
1. Add Q&A about shiny rate
2. Explain it matches modern Pokemon games
3. Note existing shiny Pokemon are unaffected

**Success Criteria**:
- FAQ entry created
- Covers common questions

---

### Task 5.3: Final Commit
**Status**: Not Started  
**Description**: Commit all changes with descriptive message  
**Actions**:
1. Stage all modified files
2. Create commit with message:
   ```
   feat: modernize shiny Pokemon odds to 1 in 4096
   
   - Modify CheckShininess to remove Attack DV constraint
   - Update documentation and comments
   - Maintain backward compatibility with existing shinies
   - Adds modern shiny odds matching Gen 6+ games
   ```

**Success Criteria**:
- All changes committed
- Commit message is descriptive
- Branch ready for merge/testing

---

## Summary

**Total Tasks**: 13
**Required Tasks**: 11 (excludes optional statistical validation and FAQ)
**Estimated Time**: 1-2 hours

**Critical Path**:
1. Verify build (Task 1.1)
2. Modify CheckShininess (Task 2.1)
3. Rebuild ROM (Task 3.1)
4. Manual testing (Task 4.1)
5. Final commit (Task 5.3)

**Parallel Tasks**:
- Documentation updates (Tasks 2.2, 2.3)
- Testing (Tasks 3.2, 3.3, 4.2, 4.3)
- Documentation (Tasks 5.1, 5.2)
