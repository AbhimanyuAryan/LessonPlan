// Learn more about clients at https://docs.boundaryml.com/docs/snippets/clients/overview

// Using the new OpenAI Responses API for enhanced formatting

client<llm> AzureOpenAPIClient {
  provider "openai-generic"
  options {
    // use the API key it indicates in the 'models' sidebar navigation menu, and clicking on the model you want to use
    base_url env.AZURE_AI_FOUNDRY_BASE_URL
    api_key env.AZURE_AI_FOUNDRY_API_KEY
    model "gpt-4o-mini" // use the model you actually deployed
  }
}


client<llm> MistralOpenAPIClient {
  provider "openai-generic"
  options {
    // use the API key it indicates in the 'models' sidebar navigation menu, and clicking on the model you want to use
    base_url env.MINISTRAL_AI_FOUNDRY_BASE_URL
    api_key env.MINISTRAL_AI_FOUNDRY_API_KEY
    model "Ministral-3B" // use the model you actually deployed
  }
}

// https://docs.boundaryml.com/docs/snippets/clients/retry
retry_policy Constant {
  max_retries 3
  strategy {
    type constant_delay
    delay_ms 200
  }
}

retry_policy Exponential {
  max_retries 2
  strategy {
    type exponential_backoff
    delay_ms 300
    multiplier 1.5
    max_delay_ms 10000
  }
}