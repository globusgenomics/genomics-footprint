# Generate Footprints

This readme explains how to generate footprints for a tissue using as input the MINID for the desired tissue type.
Generating footprints requires running a workflow via https://bdds.globusgenomics.org which integrates a number of sub-workflows as shown in figure below to generate alignment files for all replicates in patients; then merging replicate alignment files for a patient to a single alignment file; finally, calling the footprint algorithms for each patient (i.e. Wellington, Hint).

Each step of the process will be laid out such that any user logged on to the system should be able to re-generate the footprints for a tissue type. Due to the high amount of computation used, we will supply a test MINID as input.

## Table of Contents

- [Screenshot of Workflow](#Screenshot-of-Workflow)
- [Test MINID](#Test-MINID)
- [Process steps](#Process-steps)
    - [Log on to BDDS Globus Genomics](#Log-on-to-BDDS-Globus-Genomics)
    - [Generate API Key](#Generate-API-Key)
    - [Import published workflows](#Import-publised-workflows)
    - [Execute analysis](#Execute-analysis)
    - [View results](#View-results)

## Screenshot of Workflow

The workflow consists of one master workflow which manages the sub-workflows. The input to the master workflow is the MINID for the tissue type you wish to generate footprints for. The MINIDs represent a BDbag for the tissue type which contains the DNAse data from the ENCODE database. These MINIDs and BDbags have been previously generated. The red box in the master workflow submits in parallel the alignment sub-workflow for each patient in the tissue type. Each patient may contain 1 to many replicates, thus, each replicate must be individually aligned (gray box). Once the replicates for a patient are aligned, they are merged to a single alignment file representing a patient. When all merged patient alignemnt files are completed (red box) an alignemnts BDbag is generated and used as input to generate the footprints (green box).

![Screenshot](Figure5c.png)

## Test MIND

## Process steps

### Log on to BDDS Globus Genomics

### Generate API Key

### Import published workflows

### Execute analysis

### View results
