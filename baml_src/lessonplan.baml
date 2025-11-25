class LessonPlan {
  topic string @description("The main data structures topic for the lesson")
  learningObjectives string[] @description("Key concepts students should learn")
  activities string[] @description("Engaging activities to teach the concept")
  materials string[] @description("Required materials for the lesson")
  timeAllocation int @alias("time_allocation_mins")
  assessmentMethod string @description("How to check student understanding")
  differentiationStrategies string[] @description("Ways to adjust for different learning levels")
  codeExamples string[] @description("Code examples demonstrating the data structure")
}

function CreateLessonPlan(topic: string) -> LessonPlan {
  client "AzureOpenAPIClient"
  prompt #"
    Create a detailed lesson plan for teaching data structures to computer science students.
    The lesson should include clear explanations, practical examples, coding exercises, and real-world applications.
    Include visualizations and hands-on coding activities where appropriate.

    {{ ctx.output_format }}

    {{ _.role("user") }} {{ topic }}
  "#
}

test LinkedListLessonTest {
  functions [CreateLessonPlan]
  args {
    topic "introduction to linked lists"
  }
}

test BinaryTreeLessonTest {
  functions [CreateLessonPlan]
  args {
    topic "binary trees and tree traversal"
  }
}

class LessonPlanEvaluation {
  pacing "slow" | "medium" | "fast" @description("How fast the lesson is paced")
  complexity "beginner" | "intermediate" | "advanced" @description("Difficulty level of the content")
  practicalRelevance int @description("Rating of real-world applicability (1-10)")
  suggestedImprovements string[] @description("Ways to enhance the lesson plan")
}

function EvaluateLessonPlan(topic: string, lessonPlan: LessonPlan) -> LessonPlanEvaluation {
  client "AzureOpenAPIClient"
  prompt #"
    Evaluate the data structures lesson plan for computer science students.
    Consider the clarity of explanations, quality of code examples, practical applicability,
    and whether the pacing is appropriate for the complexity of the topic.

    {{ ctx.output_format }}

    {{ _.role("user") }} {{ lessonPlan }}
  "#
}