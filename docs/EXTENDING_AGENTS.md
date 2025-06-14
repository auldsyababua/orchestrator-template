# Extending the Agent Team

This template provides a core set of general-purpose agents: `Planner`, `Coder`, `Tester`, `Reviewer` and `Router`. However, you can achieve more powerful and specialized results by creating new agents with specific roles.

The simplest way to extend the team is to create a new `your_agent_name_agent.py` file in the `/agents` directory, and then add it to the `route_task` function in `router_agent.py`.

## Specializing the Coder Agent

While the base `Coder` agent is a generalist, software development often requires specialized skills. It can be powerful to split the `Coder` role into `Frontend` and `Backend` specialists. This allows you to give them more specific instructions and tools for their domain.

### How to Create a Frontend Engineer Agent

1.  **Create the file:** `/agents/frontend_agent.py`
2.  **Define its role with a prompt:** This agent's prompt should prime it to think about user interfaces, components, and client-side logic. It needs to know which frameworks and tools to use.

    ```python
    # Inside frontend_agent.py

    async def handle_frontend_code(plan: dict) -> str:
        """
        Generates frontend code based on a plan.
        """
        prompt = f"""
        You are an expert frontend engineer specializing in React and Tailwind CSS.
        Based on the following plan, write the JSX code for the specified component.
        The component should be self-contained and well-commented.

        Plan:
        {plan}
        """
        # This is where you would call an LLM with the prompt
        # and then use the Filesystem MCP to write the file.
        # ...
        return "✅ Frontend component created."

    ```

### How to Create a Backend Engineer Agent

1.  **Create the file:** `/agents/backend_agent.py`
2.  **Define its role with a prompt:** This agent's prompt focuses on server-side logic, database interactions, and API design.

    ```python
    # Inside backend_agent.py

    async def handle_backend_code(plan: dict) -> str:
        """
        Generates backend code based on a plan.
        """
        prompt = f"""
        You are an expert backend engineer specializing in Python with FastAPI.
        Based on the following plan, write the code for the API endpoint,
        including data validation with Pydantic and proper error handling.

        Plan:
        {plan}
        """
        # This is where you would call an LLM with the prompt
        # and then use the Filesystem MCP to write the file.
        # ...
        return "✅ Backend endpoint created."
    ```

### Why do this?

By splitting the Coder into specialists, you are replicating a real-world development team. You can give the `Frontend` agent a toolset (e.g., an MCP server that transpiles TypeScript) that the `Backend` agent doesn't need, and vice-versa. This separation of concerns makes your multi-agent system more modular, scalable, and effective at complex software development tasks.