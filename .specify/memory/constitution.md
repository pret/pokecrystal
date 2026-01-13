# PokemonModernCrystal Constitution

## Core Principles

### I. Hardware Compatibility (NON-NEGOTIABLE)

All features must work on original Game Boy Color hardware, not just emulators. This means:
- Strict adherence to Game Boy Color hardware limitations (CPU speed, memory, VRAM, sprite limits, palette restrictions)
- No features that require enhanced emulator capabilities or ROM hacks that break hardware compatibility
- Testing on real hardware or cycle-accurate emulators is required for significant changes
- ROM size must fit within supported cartridge sizes
- No timing-dependent code that only works at emulator speeds

### II. Vanilla Faithful

Modifications must preserve the look, feel, and spirit of the original Pokémon Crystal. This means:
- Aesthetic changes should match the original art style and color palettes
- Gameplay changes should feel like natural evolutions, not radical departures
- User interface modifications should maintain the original game's visual language
- New features should feel like they "could have been" in the original game
- Avoid modern conveniences that break immersion (e.g., no mini-maps, auto-battle, excessive hand-holding)

### III. Quality Over Quantity

Every addition must justify its existence and maintain high quality standards:
- Features must be fully implemented and polished, not half-finished experiments
- Bug fixes and improvements to existing content take precedence over new additions
- Code must be maintainable and well-documented for future contributors
- Respect the original developers' design decisions unless there's a compelling reason to change them

### IV. Technical Standards

Maintain clean, readable, and maintainable assembly code:
- Follow the existing code style documented in [STYLE.md](file:///c%3A/Projects/Personal/PokemonModernCrystal/STYLE.md)
- Use clear labels and comments for complex logic
- Keep related code organized in logical files and directories
- Ensure changes integrate cleanly with the existing codebase structure

### V. Preserve Player Experience

Changes should enhance, not disrupt, the core gameplay experience:
- Don't break existing save files unless absolutely necessary (and provide migration tools if required)
- Maintain game balance - no changes that make the game trivially easy or frustratingly hard
- Respect pacing and progression of the original game
- Optional features should be discoverable but not intrusive

## Hardware Constraints

All development must respect Game Boy Color hardware limitations:

- **CPU**: 8-bit Sharp LR35902 at ~4.19 MHz (or ~8.38 MHz in double-speed mode)
- **RAM**: 32 KB work RAM + 8 KB video RAM
- **ROM**: Must fit within standard cartridge sizes (typically up to 2 MB)
- **Display**: 160x144 pixels, 10 sprites per scanline, 40 total sprites
- **Colors**: 32,768 colors available, 4 colors per palette, 8 background + 8 sprite palettes
- **Audio**: 4 sound channels (2 pulse, 1 wave, 1 noise)
- **Save Data**: Battery-backed SRAM with size constraints based on cartridge type

Performance considerations:
- Frame budget: ~16.7ms per frame (59.7 FPS)
- VRAM access only during specific periods (VBlank/HBlank)
- CPU cycles must be carefully managed for time-critical operations

## Development Workflow

### Feature Approval
- Propose features with clear rationale for how they improve the game while staying vanilla-faithful
- Discuss potential hardware implications before implementation
- Get consensus from maintainers for significant changes

### Testing Requirements
- Test on accurate emulators (BGB, SameBoy recommended)
- For major features, test on real hardware when possible
- Verify no timing issues, graphical glitches, or crashes
- Test with multiple save states and edge cases

### Code Review Standards
- Verify hardware compatibility claims
- Check adherence to STYLE.md conventions
- Ensure documentation is clear for future maintainers
- Validate that changes maintain vanilla aesthetic

## Governance

This constitution supersedes all other development practices and guidelines. All feature specifications, plans, and implementations must comply with these principles.

**Amendment Process**:
- Proposed amendments must be discussed with maintainers
- Changes require strong justification and community consensus
- Breaking changes to core principles require clear documentation of rationale

**Compliance**:
- All feature specifications must explicitly address hardware compatibility
- Code reviews must verify constitutional compliance
- Non-compliant features will be rejected regardless of technical merit

**Version**: 1.0.0 | **Ratified**: 2026-01-12 | **Last Amended**: 2026-01-12
