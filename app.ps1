# Step 1: Read the input JSON file
$inputFile = "input.json"
$data = Get-Content -Path $inputFile | ConvertFrom-Json

# Step 2: Generate a tailored cover letter using Ollama
$prompt = "Generate a tailored cover letter for a $($data.job_title) position at $($data.company_name). The candidate's name is $($data.name). Here is the job description: $($data.job_description)."
$ollamaResponse = ollama run llama2 $prompt

# Step 3: Save the generated cover letter
$coverLetterFile = "cover_letter.txt"
$ollamaResponse = ollama run llama2 --max-tokens 200 $prompt

Write-Host "Cover letter saved to $coverLetterFile"