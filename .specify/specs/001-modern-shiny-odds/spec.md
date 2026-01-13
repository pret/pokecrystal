# Feature Specification: Modern Shiny Pokemon Odds

**Feature Branch**: `001-modern-shiny-odds`  
**Created**: January 12, 2026  
**Status**: Draft  
**Input**: User description: "Modernize the odds of getting a shiny Pokemon to match modern games using the existing framework"

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Player Encounters Shiny Pokemon (Priority: P1)

A player encounters wild Pokemon during normal gameplay and occasionally encounters shiny variants at the modern rate, creating exciting and memorable moments.

**Why this priority**: This is the core feature - updating the odds calculation to match modern games. Without this, the feature doesn't exist.

**Independent Test**: Can be fully tested by encountering multiple wild Pokemon and verifying that shiny Pokemon appear at the expected rate (approximately 1 in 4096 encounters).

**Acceptance Scenarios**:

1. **Given** a player encounters a wild Pokemon, **When** the game determines if it's shiny, **Then** it uses the modern odds calculation (1 in 4096)
2. **Given** a player encounters 4096 wild Pokemon, **When** statistically analyzed, **Then** approximately 1 Pokemon should be shiny (within expected variance)
3. **Given** a shiny Pokemon is encountered, **When** displayed in battle, **Then** it shows the distinctive shiny coloration

---

### User Story 2 - Breeding for Shiny Pokemon (Priority: P2)

A player breeds Pokemon at the Day Care and receives eggs that can hatch into shiny Pokemon at the modern rate.

**Why this priority**: Breeding is a common method for obtaining shiny Pokemon, but depends on the core odds calculation being implemented first.

**Independent Test**: Can be fully tested by breeding multiple eggs and verifying shiny hatches occur at the expected rate.

**Acceptance Scenarios**:

1. **Given** a player breeds two Pokemon, **When** an egg hatches, **Then** the modern shiny odds (1 in 4096) apply to the hatched Pokemon
2. **Given** a player hatches 100 eggs, **When** shiny rates are calculated, **Then** the odds match modern game mechanics

---

### User Story 3 - Static Pokemon Encounters (Priority: P3)

A player encounters static Pokemon (legendaries, gift Pokemon, starters) and they can be shiny at the modern rate.

**Why this priority**: Static encounters are less common but still important for completeness. This ensures consistency across all Pokemon encounter types.

**Independent Test**: Can be fully tested by resetting and re-encountering static Pokemon to verify shiny odds apply.

**Acceptance Scenarios**:

1. **Given** a player encounters a static Pokemon (legendary, starter, gift), **When** the game determines if it's shiny, **Then** it uses the modern odds (1 in 4096)
2. **Given** a player soft-resets to re-encounter a static Pokemon, **When** checking multiple times, **Then** the shiny rate is consistent with modern odds

---

### Edge Cases

- What happens when the shiny determination occurs? (Should happen at encounter/egg generation, not during battle initialization)
- How does the system handle Pokemon received through trades or events? (They should maintain their shiny status but not re-roll)
- What if shiny odds are checked multiple times for the same Pokemon? (Should only determine once and persist)
- Does the modern rate apply to all Pokemon species, or are there exceptions? (Should apply universally unless specific species mechanics require otherwise)

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: System MUST calculate shiny odds using the modern rate of 1 in 4096 (compared to the original Generation II rate of 1 in 8192)
- **FR-002**: System MUST apply modern shiny odds to all wild Pokemon encounters
- **FR-003**: System MUST apply modern shiny odds to all bred/hatched Pokemon
- **FR-004**: System MUST apply modern shiny odds to all static Pokemon encounters (legendaries, starters, gifts)
- **FR-005**: System MUST use the existing shiny determination framework without requiring major overhaul of the codebase
- **FR-006**: System MUST maintain backward compatibility with existing save files (Pokemon already caught remain unchanged)
- **FR-007**: System MUST preserve the existing shiny appearance and battle mechanics (only odds change, not visual or gameplay behavior)

### Key Entities *(include if feature involves data)*

- **Wild Pokemon**: Encountered during random battles; shiny determination occurs at encounter generation
- **Bred Pokemon**: Generated through Day Care breeding; shiny determination occurs at egg generation
- **Static Pokemon**: Fixed encounters (starters, legendaries, gifts); shiny determination occurs at encounter initialization
- **Shiny Rate Constant**: The numerical value defining odds (1/4096 for modern games vs 1/8192 for original)

## Success Criteria *(mandatory)*

### Measurable Outcomes

- **SC-001**: Shiny Pokemon encounter rate is approximately 1 in 4096 when tested across a statistically significant sample (at least 10,000 encounters)
- **SC-002**: Players can obtain shiny Pokemon through wild encounters, breeding, and static encounters using the updated odds
- **SC-003**: Existing save files load correctly with no corruption or loss of existing shiny Pokemon
- **SC-004**: The change requires modification of only the shiny odds constant value, not extensive code refactoring (minimal code changes)
- **SC-005**: Game performance remains unchanged (no measurable increase in encounter generation time)

## Assumptions *(optional)*

- The game currently uses the Generation II shiny odds (1 in 8192)
- The existing codebase has a shiny determination mechanism that can be updated by changing a constant or calculation
- Modern Pokemon games (Generation VI and later) use 1 in 4096 as the base shiny rate
- The term "modern odds" refers to the 1 in 4096 rate used in current Pokemon games
- Shiny Charm and other shiny-boosting mechanics (if present) should work proportionally with the new base rate
- No changes are needed to shiny appearance, sound effects, or battle behavior

## Known Behaviors *(optional)*

### Gender Distribution
Due to how Gender II determines gender using Attack and Speed DVs, the modern shiny pattern creates an interesting gender distribution:

- **Shiny Pokemon with 87.5% male species** (e.g., starters): 50% of shinies will be female instead of the normal 12.5%
- **Attack DV = 5, Speed DV = 6 or 14**: Results in female for species with high male ratios
- **Attack DV = 13, Speed DV = 6 or 14**: Results in male as expected

This makes female shiny starters significantly more common than in the original game, which some players may view as a feature rather than a bug.

## Out of Scope *(optional)*

- Adding Shiny Charm or other shiny-boosting items/mechanics
- Changing shiny color palettes or visual effects
- Implementing chain fishing, Poké Radar, or other shiny hunting mechanics from later generations
- Modifying shiny rates for specific species or encounter types beyond the base rate change
- Adding notifications or special indicators when encountering shiny Pokemon
- Decoupling gender determination from shiny determination (would require fundamental DV system changes)
