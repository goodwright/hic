include { PREPARE_GENOME } from '../../subworkflows/local/prepare_genome.nf'

workflow {
    // Run wrapper
    
    Channel.fromPath( params.fasta )
       .ifEmpty { exit 1, "Genome index: Fasta file not found: ${params.fasta}" }
       .map{it->[[:],it]}
       .set { ch_fasta }

    PREPARE_GENOME (
        ch_fasta,
        "",
    )
}
