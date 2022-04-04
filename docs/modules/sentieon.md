---
Name: Sentieon
URL: https://www.sentieon.com/products/
Description: >
  Sentieon-dnaseq produces many outputs. This module deals with 3 Picard
  equivalents which do not transfer well to MultiQC. The code for each script
  is split into its own file and adds a section to the module output if
  logs are found.
---

The Sentieon module parses output from the Sentieon dna-seq suite of tools,
which themselves are implementations of certain Picard metrics
[Picard](http://broadinstitute.github.io/picard/),
a set of Java command line tools for manipulating high-throughput
sequencing data.

Supported commands:

- `InsertSizeMetrics`
- `GcBiasMetrics`
- `AlignmentSummaryMetrics`
- `HsMetricsAlgo`

#### HsMetrics Compatibility

HsMetrics can be customised as per the Picard implementation, but operates as a separate module. Because of this, if both are in the same set of MultiQC data, results from Picard and Sentieon HsMetrics will appear in the general stats table. Both can be customised separately with the Sentieon implementation using the config ID `sentieon_config`. E.g., the example in the Picard CollecHsMetrics docs:

```yaml
picard_config:
  general_stats_target_coverage:
    - 10
    - 50
  HsMetrics_table_cols:
    - NEAR_BAIT_BASES
    - OFF_BAIT_BASES
    - ON_BAIT_BASES
  HsMetrics_table_cols_hidden:
    - MAX_TARGET_COVERAGE
    - MEAN_BAIT_COVERAGE
    - MEAN_TARGET_COVERAGE
```

becomes:

```yaml
sentieon_config:
  general_stats_target_coverage:
    - 10
    - 50
  HsMetrics_table_cols:
    - NEAR_BAIT_BASES
    - OFF_BAIT_BASES
    - ON_BAIT_BASES
  HsMetrics_table_cols_hidden:
    - MAX_TARGET_COVERAGE
    - MEAN_BAIT_COVERAGE
    - MEAN_TARGET_COVERAGE
```
