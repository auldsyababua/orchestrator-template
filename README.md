# Orchestrator Template

A multi-agent orchestration template for building AI-powered applications with specialized agents for planning, coding, reviewing, and testing.

## Overview

This template provides a foundation for creating multi-agent systems where different AI agents collaborate to accomplish complex tasks. It includes:

- **Planner Agent**: Breaks down high-level tasks into actionable steps
- **Router Agent**: Intelligently routes tasks to appropriate specialized agents
- **Coder Agent**: Implements code based on specifications
- **Reviewer Agent**: Reviews code for quality, best practices, and potential issues
- **Tester Agent**: Creates and runs tests to ensure code correctness

## Quick Start

Clone and set up a new project with a single command:

```bash
curl -sSL https://raw.githubusercontent.com/YOUR_USERNAME/orchestrator-template/main/setup.sh | bash -s my-new-project
```

Or manually:

```bash
# Clone the template
git clone https://github.com/YOUR_USERNAME/orchestrator-template.git my-new-project
cd my-new-project

# Create and activate virtual environment
python3 -m venv .venv
source .venv/bin/activate  # On Windows: .venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Run the orchestrator
python main.py
```

## Project Structure

```
orchestrator-template/
├── agents/
│   ├── planner_agent.py    # Task planning and decomposition
│   ├── router_agent.py     # Task routing logic
│   ├── coder_agent.py      # Code implementation
│   ├── reviewer_agent.py   # Code review and quality checks
│   └── tester_agent.py     # Test creation and execution
├── tools/
│   ├── __init__.py
│   ├── load_template.py    # Template loading utilities
│   ├── write_file.py       # File writing utilities
│   └── run_tests.py        # Test execution utilities
├── main.py                 # Main orchestrator entry point
├── plan_state.py          # Shared state management
├── requirements.txt       # Python dependencies
├── setup.sh              # One-click setup script
└── README.md             # This file
```

## Configuration

### Environment Variables

Create a `.env` file in your project root:

```env
# Add your API keys and configuration here
OPENAI_API_KEY=your_api_key_here
# Add other configuration as needed
```

### Customizing Agents

Each agent can be customized by modifying its corresponding file in the `agents/` directory. The base structure provides:

1. **Agent initialization** with specific roles and capabilities
2. **Task processing** logic
3. **Inter-agent communication** through the router

## Usage

### Basic Example

```python
from main import run_orchestrator

# Define your task
task = "Create a Python function that calculates fibonacci numbers with tests"

# Run the orchestrator
result = run_orchestrator(task)
```

### Adding New Agents

1. Create a new agent file in `agents/`:

```python
# agents/my_custom_agent.py
class MyCustomAgent:
    def __init__(self):
        self.name = "CustomAgent"
        self.capabilities = ["custom_task"]
    
    def process(self, task):
        # Implement your agent logic
        return result
```

2. Register the agent in `main.py`
3. Update the router logic to include your new agent

### Adding New Tools

1. Create a new tool file in `tools/`:

```python
# tools/my_tool.py
def my_tool_function(params):
    # Implement tool logic
    return result
```

2. Import and use in your agents as needed

## Development

### Running Tests

```bash
python -m pytest tests/
```

### Code Style

This template follows PEP 8 guidelines. Run linting:

```bash
flake8 .
```

### Contributing to the Template

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## Common Use Cases

- **Code Generation**: Use the orchestrator to generate complete applications
- **Code Review**: Automated code review and improvement suggestions
- **Test Generation**: Automatic test creation for existing code
- **Refactoring**: Intelligent code refactoring with safety checks
- **Documentation**: Generate documentation from code

## Troubleshooting

### Common Issues

1. **Import Errors**: Ensure you've activated the virtual environment
2. **API Key Issues**: Check your `.env` file configuration
3. **Agent Communication**: Verify the router agent is properly configured

### Debug Mode

Enable debug logging:

```python
import logging
logging.basicConfig(level=logging.DEBUG)
```

## License

MIT License - feel free to use this template for any project

## Support

For issues and questions:
- Open an issue on GitHub
- Check existing issues for solutions
- Review the documentation

---

Built with ❤️ for AI-powered development